//
//  MainViewController.h
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Website.h"
#import "FlipsideViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "WebsiteListViewController.h"
#import "YRoundedButton.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, 
													DetailViewControllerDelegate,
													AddViewControllerDelegate,
													WebsiteListViewControllerDelegate> 
{
    IBOutlet UILabel *loginLabel;
    IBOutlet UILabel *urlLabel;
	IBOutlet UILabel *passwordLabel;
	IBOutlet UIImageView *blueHighlightImage;
	IBOutlet UIImageView *whiteHighlightImage;
	IBOutlet UIButton *detailViewButton;
	IBOutlet UIButton *selectWebsiteButton;
	IBOutlet UIButton *addButton;
	Website *website;
	NSManagedObjectContext *managedObjectContext;
	NSString *masterPassword;
}

@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Website *website;
@property (nonatomic, retain) NSString *masterPassword;

- (IBAction)showInfo:(id)sender;
- (IBAction)adjustProperties:(id)sender;
- (IBAction)addWebsite:(id)sender;
- (IBAction)chooseWebsite:(id)sender;
- (IBAction)copyPasswordToClipboard:(id)sender;
- (IBAction)copyLoginToClipboard:(id)sender;
- (IBAction)goToWebsite:(id)sender;

- (void)initHilight;
- (void)hideHilight;
- (void)highlightLogin;
- (void)highlightPassword;
- (void)updatePassword;
- (int)save;
- (NSMutableArray *)arrayOfWebsites ;
- (NSString *)hex_sha1:(NSString *)inputString;
- (NSString *)b64_sha1:(NSString *)inputString;

@end
