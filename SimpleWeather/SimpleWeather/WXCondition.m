//
//  WXCondition.m
//  SimpleWeather
//
//  Created by 夏敏 on 4/28/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import "WXCondition.h"
#import "Weather.h"

#define MPS_TO_MPH 2.23694f

@implementation WXCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"date": @"dt",
             @"locationName": @"name",
             @"humidity": @"main.humidity",
             @"temperature": @"main.temp",
             @"tempHigh": @"main.temp_max",
             @"tempLow": @"main.temp_min",
             @"sunrise": @"sys.sunrise",
             @"sunset": @"sys.sunset",
//             @"conditionDescription": @"weather.description",
//             @"condition": @"weather.main",
//             @"icon": @"weather.icon",
             @"windBearing": @"wind.deg",
             @"windSpeed": @"wind.speed",
             @"weathers":@"weather"
             };
}

//-------------------------------------------------//

+ (NSValueTransformer *)dateJSONTransformer {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
        //
        return [NSDate dateWithTimeIntervalSince1970:str.floatValue];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        //
        return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
    }];
    
}

+ (NSValueTransformer *)sunriseJSONTransformer {
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)sunsetJSONTransformer {
    return [self dateJSONTransformer];
}


//-------------------------------------------------//

//+ (NSValueTransformer *)conditionDescriptionJSONTransformer {
//    
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *values, BOOL *success, NSError *__autoreleasing *error) {
//        //
//        if (success) {
//            
//        }
//        else {
//            NSLog(@"%@",error);
//        }
//        return [values firstObject];
//    } reverseBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
//        //
//        return @[str];
//    }];
//}
//
//
//+ (NSValueTransformer *)conditionJSONTransformer {
//    return [self conditionDescriptionJSONTransformer];
//}
//
//+ (NSValueTransformer *)iconJSONTransformer {
//    return [self conditionDescriptionJSONTransformer];
//}


+(NSValueTransformer *)weathersJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Weather.class];
}


-(NSString *)conditionDescription {
    return [self.weathers firstObject].conditionDescription;
}

-(NSString *)condition {
    return [self.weathers firstObject].condition;
}

-(NSString *)icon {
    return [self.weathers firstObject].icon;
}


//-------------------------------------------------//

+ (NSValueTransformer *)windSpeedJSONTransformer {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *num, BOOL *success, NSError *__autoreleasing *error) {
        //
        return @(num.floatValue*MPS_TO_MPH);
    } reverseBlock:^id(NSNumber *speed, BOOL *success, NSError *__autoreleasing *error) {
        //
        return @(speed.floatValue/MPS_TO_MPH);
    }];
}

//-------------------------------------------------//

+ (NSDictionary *)imageMap {
    static NSDictionary *_imageMap = nil;
    if (! _imageMap) {
        _imageMap = @{
                      @"01d" : @"weather-clear",
                      @"02d" : @"weather-few",
                      @"03d" : @"weather-few",
                      @"04d" : @"weather-broken",
                      @"09d" : @"weather-shower",
                      @"10d" : @"weather-rain",
                      @"11d" : @"weather-tstorm",
                      @"13d" : @"weather-snow",
                      @"50d" : @"weather-mist",
                      @"01n" : @"weather-moon",
                      @"02n" : @"weather-few-night",
                      @"03n" : @"weather-few-night",
                      @"04n" : @"weather-broken",
                      @"09n" : @"weather-shower",
                      @"10n" : @"weather-rain-night",
                      @"11n" : @"weather-tstorm",
                      @"13n" : @"weather-snow",
                      @"50n" : @"weather-mist",
                      };
    }
    return _imageMap;
}

- (NSString *)imageName {
    return [WXCondition imageMap][self.icon];
}



@end
