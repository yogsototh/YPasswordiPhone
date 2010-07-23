//
//  WebsiteListViewController.h
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol WebsiteListViewControllerDelegate;


@interface WebsiteListViewController : UIViewController {
    IBOutlet id navigationController;
    IBOutlet id tableViewController;
	id <WebsiteListViewControllerDelegate> delegate;
    NSManagedObjectContext *managedObjectContext;
}
@property (nonatomic,assign) id delegate;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@end

@protocol WebsiteListViewControllerDelegate
- (void)websiteListViewControllerDidFinish:(WebsiteListViewController *)controller;
@end