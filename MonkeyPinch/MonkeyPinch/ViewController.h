//
//  ViewController.h
//  MonkeyPinch
//
//  Created by 夏敏 on 3/18/16.
//  Copyright © 2016 夏敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TickleGestureRecognizer.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

- (IBAction)bananaHandlePan:(UIPanGestureRecognizer *)sender;

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;


- (IBAction)bananaHandlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)bananaHandleRotate:(UIRotationGestureRecognizer *)recognizer;


@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *bananaPan;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *monkeyPan;


@property (strong) AVAudioPlayer * chompPlayer;

- (void)handleTap:(UITapGestureRecognizer *)recognizer;


@property (strong) AVAudioPlayer * hehePlayer;
- (void)handleTickle:(TickleGestureRecognizer *)recognizer;

@end

