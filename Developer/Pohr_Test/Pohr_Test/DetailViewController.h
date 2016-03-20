//
//  DetailViewController.h
//  Pohr_Test
//
//  Created by 夏敏 on 15/9/9.
//  Copyright (c) 2015年 夏敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

