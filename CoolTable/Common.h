//
//  Common.h
//  CoolTable
//
//  Created by 夏敏 on 5/3/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import <UIKit/UIKit.h>

void drawLinearGradient(CGContextRef context,CGRect rect, CGColorRef startColor, CGColorRef endColor);

CGRect rectFor1PxStroke(CGRect rect);
void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint,CGColorRef color);

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);
