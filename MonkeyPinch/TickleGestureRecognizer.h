//
//  TickleGestureRecognizer.h
//  MonkeyPinch
//
//  Created by 夏敏 on 3/20/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DirectionUnknown = 0,
    DirectionLeft,
    DirectionRight
}Direction;

@interface TickleGestureRecognizer : UIGestureRecognizer

@property (assign) int tickleCount;
@property (assign) CGPoint curTickleStart;
@property (assign) Direction lastDirection;


@end
