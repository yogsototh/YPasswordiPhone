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

- (IBAction)next:(id)sender {
    NSLog(@"next");    
}

- (IBAction)previous:(id)sender {
	NSLog(@"previous");    
}

- (IBAction)reset:(id)sender {
	NSLog(@"reset");
}

- (IBAction)sliderChanged:(id)sender {
	NSLog(@"sliderChanged");
	[lengthLabel setText:[NSString stringWithFormat:@"%d", (int)[slider value]]];
}

- (IBAction)segmentedControlChanged:(id)sender {
	NSLog(@"segmentedControlChanged");
	if (segmentedControl.selectedSegmentIndex == 0) {
		NSLog(@"Base64");
	} else {
		NSLog(@"Base16");
	}

}


#pragma mark Action With Entities

- (IBAction)urlTextFieldChanged:(id)sender {
	NSLog(@"urlTextFieldChanged:");
	
	// add a new website
	Website *website=(Website *)[NSEntityDescription insertNewObjectForEntityForName:@"Website" inManagedObjectContext:managedObjectContext];
	[website setUrl:[urlTextField text]];
	[website setLogin:[loginTextField text]];
	
	NSError *error;
	if (![managedObjectContext save:&error]) {
		// Handle the error
		NSLog(@"Error while saving new website");
	}
}

- (IBAction)loginTextFieldChanged:(id)sender {
	NSLog(@"loginTextFieldChanged");
}

- (IBAction)done:(id)sender {
	NSLog(@"done");
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
