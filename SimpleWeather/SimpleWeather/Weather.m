//
//  Weather.m
//  SimpleWeather
//
//  Created by 夏敏 on 5/3/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"conditionDescription":@"description",
             @"condition":@"main",
             @"icon":@"icon"
             };
}

@end
