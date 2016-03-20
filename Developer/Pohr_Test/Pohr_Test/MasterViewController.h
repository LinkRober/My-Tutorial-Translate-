//
//  MasterViewController.h
//  Pohr_Test
//
//  Created by 夏敏 on 15/9/9.
//  Copyright (c) 2015年 夏敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

