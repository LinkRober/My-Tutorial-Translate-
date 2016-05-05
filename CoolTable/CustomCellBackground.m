//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by 夏敏 on 5/3/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground


-(void)drawRect:(CGRect)rect {
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    CGContextFillRect(context, self.bounds);
     */
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor * separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
//    UIColor *redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    
//    CGRect storeRect = CGRectInset(paperRect, 5.0, 5.0);
//    CGRect storeRect = rectFor1PxStroke(CGRectInset(paperRect, 5.0, 5.0));
    CGRect stroRect = paperRect;
    stroRect.size.height -= 1;
    stroRect = rectFor1PxStroke(stroRect);
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, stroRect);
    
    
    
    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
    draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
}


@end
