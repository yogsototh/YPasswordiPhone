//
//  detailView.m
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Website.h"

@implementation DetailViewController

@synthesize delegate;

@synthesize managedObjectContext;

@synthesize website;

- (int) save {
	NSError *error;
	if (![managedObjectContext save:&error]) {
		NSLog(@"ERROR : save error : DetailViewController::save");
		return -1;
	} else {
		return 0;
	}
}

- (IBAction)next:(id)sender {
	[website setValue:[NSNumber numberWithInt:([website.passwordNumber intValue] + 1)]  forKey:@"passwordNumber"];
	[passwordNumberLabel setText:[[website passwordNumber] stringValue]];
    [self save];
}

- (IBAction)previous:(id)sender {
	[website setValue:[NSNumber numberWithInt:([website.passwordNumber intValue] - 1)]  forKey:@"passwordNumber"];	
	[passwordNumberLabel setText:[[website passwordNumber] stringValue]];
    [self save];
}

- (IBAction)reset:(id)sender {
	[website setValue:[NSNumber numberWithInt:0] forKey:@"passwordNumber"];
	[passwordNumberLabel setText:[[website passwordNumber] stringValue]];
    [self save];
}

- (IBAction)sliderChanged:(id)sender {
	[lengthLabel setText:[NSString stringWithFormat:@"%d", (int)[slider value]]];
	[website setValue:[NSNumber numberWithInt:(int)[slider value]] forKey:@"passwordLength"];
    [self save];
}

- (IBAction)segmentedControlChanged:(id)sender {
	if (segmentedControl.selectedSegmentIndex == 0) {
		int newValue=MIN(27.0,[website.passwordLength floatValue]);
		[lengthLabel setText:[NSString stringWithFormat:@"%d", newValue]];
		website.base64 = [NSNumber numberWithBool:YES];
		// add .5 to the slider position to be aligned with the good value
		[slider setValue:MIN(newValue+.5,27.0)];
	} else {
		// add .5 to the slider position to be aligned with the good value
		[slider setValue:[website.passwordLength floatValue]+.5];
		[lengthLabel setText:[NSString stringWithFormat:@"%d", [website.passwordLength intValue]]];
		website.base64 = [NSNumber numberWithBool:NO];
	}
    [self save];
}


#pragma mark Action With Entities

- (IBAction)urlTextFieldChanged:(id)sender {
	[website setValue:[urlTextField text] forKey:@"url"];
    [self save];	
}

- (IBAction)loginTextFieldChanged:(id)sender {
	[website setValue:[loginTextField text] forKey:@"login"];
    [self save];
}

- (IBAction)done:(id)sender {
	// save the password length another time in case of type changed
	if (([website.base64 isEqualToNumber:[NSNumber numberWithBool:YES]]) &&
		([website.passwordLength intValue]>27)) {
		[website setValue:[NSNumber numberWithInt:27] forKey:@"passwordLength"];
        [self save];
	}
	[self.delegate detailViewControllerDidFinish:self];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[slider setMaximumValue:40.0];
	if (website == nil) {
		[urlTextField setText:@"URL"];
		[loginTextField setText:@"username"];
		[lengthLabel setText:@"27"];
		[slider setValue:27.0];
		[passwordNumberLabel setText:@"0"];
		[segmentedControl setSelectedSegmentIndex:0];
	} else {
		[urlTextField setText:website.url];
		[loginTextField setText:website.login];
		
		[lengthLabel setText:[website.passwordLength stringValue]];
		[slider setValue:[website.passwordLength intValue]];
		
		[passwordNumberLabel setText:[website.passwordNumber stringValue]];
		
		// initialize segmented control
		int segmentedControlIndexToSelect;
		if ([website.base64 isEqualToNumber:[NSNumber numberWithBool:YES]]) {
			segmentedControlIndexToSelect=0;
		} else {
			segmentedControlIndexToSelect=1;
		}
		[segmentedControl setSelectedSegmentIndex:segmentedControlIndexToSelect];
	}
	
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark UITextField delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
