//
//  detailView.h
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerDelegate;

@interface DetailViewController : UIViewController {
    IBOutlet UILabel *passwordNumberLabel;
    IBOutlet UISlider *slider;
    IBOutlet UISegmentedControl *segmentedControl;
    IBOutlet UILabel *lengthLabel;
	id <DetailViewControllerDelegate> delegate;
}
@property (nonatomic,assign) id delegate;
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