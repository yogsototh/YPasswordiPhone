//
//  AddViewController.h
//
//  Created by Yann Esposito on 07/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Website.h"

@protocol AddViewControllerDelegate;

@interface AddViewController : UIViewController {
    IBOutlet UITextField *login;
    IBOutlet UITextField *url;
	IBOutlet UIBarButtonItem *doneButton;

	// -- partage du website --
	Website *website;
	id <AddViewControllerDelegate> delegate;
    NSManagedObjectContext *managedObjectContext;	
}
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)urlChanged:(id)sender;

@property (nonatomic,assign) id delegate;
@property (nonatomic, assign) Website *website;
@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;

@end

@protocol AddViewControllerDelegate
- (void)addViewControllerDidFinish:(AddViewController *)controller;
@end