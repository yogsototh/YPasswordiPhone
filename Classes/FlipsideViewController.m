//
//  FlipsideViewController.m
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
	[masterPasswordTextField setText:[[self delegate] masterPassword]];
	if ([[masterPasswordTextField text] length]) {
		[doneButton setEnabled:YES];
	} else {
		[doneButton setEnabled:NO];
	}
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

- (IBAction)masterPasswordTextFieldChanged:(id)sender {
	if ([[masterPasswordTextField text] length]) {
		[doneButton setEnabled:YES];
		[[self delegate] setMasterPassword:[masterPasswordTextField text]];
	} else {
		[doneButton setEnabled:NO];
	}
}

- (IBAction)clickedToWebSite:(id)sender {
    NSURL *target = [[NSURL alloc] initWithString:@"http://yannesposito.com"];
	[[UIApplication sharedApplication] openURL:target];
	[target release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}

#pragma mark UITextField delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
