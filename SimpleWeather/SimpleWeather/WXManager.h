//
//  WXManager.h
//  SimpleWeather
//
//  Created by 夏敏 on 4/28/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "WXCondition.h"
@class CoreLocation;

@interface WXManager : NSObject<CLLocationManagerDelegate>


+ (instancetype)shareManger;

@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong, readonly) WXCondition *currentCondition;
@property (nonatomic, strong, readonly) NSArray *hourlyForecast;
@property (nonatomic, strong, readonly) NSArray *dailyForecast;

- (void)findCurrentLocation;

@end
