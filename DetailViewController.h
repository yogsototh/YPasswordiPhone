//
//  detailView.h
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Website.h"

@protocol DetailViewControllerDelegate;

@interface DetailViewController : UIViewController {
    IBOutlet UILabel *passwordNumberLabel;
    IBOutlet UISlider *slider;
    IBOutlet UISegmentedControl *segmentedControl;
    IBOutlet UILabel *lengthLabel;
	IBOutlet UITextField *urlTextField;
	IBOutlet UITextField *loginTextField;
	Website *website;
	id <DetailViewControllerDelegate> delegate;
    NSManagedObjectContext *managedObjectContext;	
}
@property (nonatomic,assign) id delegate;
@property (nonatomic, assign) Website *website;
@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;
- (IBAction)next:(id)sender;
- (IBAction)previous:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)segmentedControlChanged:(id)sender;
- (IBAction)done:(id)sender;
@end

@protocol DetailViewControllerDelegate
- (void)detailViewControllerDidFinish:(DetailViewController *)controller;
@end