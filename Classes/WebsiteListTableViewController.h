//
//  WebsiteListTableViewController.h
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "WebsiteListViewController.h"
#import "WebsiteListNavigationController.h"

@interface WebsiteListTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate> {
    IBOutlet WebsiteListViewController *websiteListViewController;
    IBOutlet WebsiteListNavigationController *navbarController;
    NSManagedObjectContext *managedObjectContext;
	NSMutableArray *websiteArray;
}

@property (nonatomic, retain) NSMutableArray *websiteArray;
@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;
- (IBAction)add:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)edit:(UIBarButtonItem *)sender;
- (IBAction)done:(UIBarButtonItem *)sender;
@end
