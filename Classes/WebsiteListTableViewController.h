//
//  WebsiteListTableViewController.h
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface WebsiteListTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate> {
    IBOutlet id websiteListViewController;
    NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;
@end
