//
//  MainViewController.h
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "DetailViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, DetailViewControllerDelegate> {
    IBOutlet UITextField *loginTextField;
    IBOutlet UITextField *urlTextField;
	IBOutlet UILabel *passwordLabel;
    NSManagedObjectContext *managedObjectContext;	    
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (IBAction)showInfo:(id)sender;
- (IBAction)adjustProperties:(id)sender;

@end
