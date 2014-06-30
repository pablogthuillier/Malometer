//
//  MasterViewController.h
//  Malometer
//
//  Created by Pablo González Thuillier on 30/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "DetailViewController.h"

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, DismissProtocol>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
