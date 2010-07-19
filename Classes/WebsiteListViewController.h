//
//  WebsiteListViewController.h
//
//  Created by Yann Esposito on 19/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import	<CoreData/CoreData.h>
@protocol WebsiteListViewControllerDelegate;

@interface WebsiteListViewController : UIViewController {
    IBOutlet UITableView *tableView;
	id <WebsiteListViewControllerDelegate> delegate;
    NSManagedObjectContext *managedObjectContext;
	NSMutableArray *websitesArray;
}
@property (nonatomic,assign) id delegate;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *websitesArray;
- (IBAction)add:(id)sender;
- (IBAction)cancel:(id)sender;
@end


@protocol WebsiteListViewControllerDelegate
- (void)websiteViewControllerDidFinish:(WebsiteListViewController *)controller;
@end