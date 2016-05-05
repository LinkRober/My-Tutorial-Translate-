//
//  WXClient.m
//  SimpleWeather
//
//  Created by 夏敏 on 4/28/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import "WXClient.h"
#import "WXCondition.h"
#import "WXDailyForecast.h"

@interface WXClient()

@property (nonatomic, strong) NSURLSession *session;

@end


@implementation WXClient

-(instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}


- (RACSignal *)fetchJsonFromURL:(NSURL  *)url {
    NSLog(@"Fetching: %@",url.absoluteString);
    
    
    
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //
            if (!error) {
                NSError *jsonError = nil;
                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                if (!jsonError) {
                    [subscriber sendNext:json];
                }
                else {
                    [subscriber sendError:jsonError];
                }
            }
            else {
                [subscriber sendError:error];
            }
            
            [subscriber sendCompleted];
    
        }];
        
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
        
    }] doError:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


-(RACSignal *)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate{

    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&units=imperial&APPID=eccc1abf8561337f64185fa082e8becd",coordinate.latitude, coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    
    return [[self fetchJsonFromURL:url] map:^id(NSDictionary *json) {
        NSError *error = nil;
        WXCondition *conditon = [MTLJSONAdapter modelOfClass:WXCondition.class fromJSONDictionary:json error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
        return conditon;
    }];
}


-(RACSignal *)fetchHourlyForecastForLocation:(CLLocationCoordinate2D)coordinate {
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?lat=%f&lon=%f&units=imperial&cnt=12&APPID=eccc1abf8561337f64185fa082e8becd",coordinate.latitude, coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];

    return [[self fetchJsonFromURL:url] map:^id(NSDictionary *json) {
        //
        RACSequence *list = [json[@"list"] rac_sequence];
        return [[list map:^id(NSDictionary *item) {
            //
            WXCondition *conditon = [MTLJSONAdapter modelOfClass:[WXCondition class] fromJSONDictionary:item error:nil];
            return conditon;
            //
        }] array];
    }];
}

-(RACSignal *)fetchDailyForecastForLocation:(CLLocationCoordinate2D)coordinate {
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%f&lon=%f&units=imperial&cnt=7&APPID=eccc1abf8561337f64185fa082e8becd",coordinate.latitude, coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    
    return [[self fetchJsonFromURL:url] map:^id(NSDictionary *json) {
        //
        RACSequence *list = [json[@"list"] rac_sequence];
        
        return [[list map:^id(NSDictionary *item) {
            //
            return [MTLJSONAdapter modelOfClass:[WXDailyForecast class] fromJSONDictionary:item error:nil];
        }] array];
    }];
}

@end
