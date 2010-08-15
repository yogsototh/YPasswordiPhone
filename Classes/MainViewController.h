//
//  MainViewController.h
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "DetailViewController.h"
#import "WebsiteListViewController.h"
#import "Website.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, 
													DetailViewControllerDelegate,
													WebsiteListViewControllerDelegate> 
{
    IBOutlet UILabel *loginLabel;
    IBOutlet UILabel *urlLabel;
	IBOutlet UILabel *passwordLabel;
	Website *website;
	NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Website *website;

- (IBAction)showInfo:(id)sender;
- (IBAction)adjustProperties:(id)sender;
- (IBAction)chooseWebsite:(id)sender;

@end
