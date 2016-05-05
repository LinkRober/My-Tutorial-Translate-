//
//  Weather.h
//  SimpleWeather
//
//  Created by 夏敏 on 5/3/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Weather : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *conditionDescription;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *icon;

@end
