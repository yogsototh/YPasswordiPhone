//
//  AddViewController.m
//
//  Created by Yann Esposito on 07/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"
#include <QuartzCore/QuartzCore.h>

@implementation AddViewController


@synthesize delegate;
@synthesize managedObjectContext;
@synthesize website;

- (IBAction)cancel:(id)sender {
	website=nil;
    [delegate addViewControllerDidFinish:self];
}

- (IBAction)done:(id)sender {
	self.website=(Website *)[NSEntityDescription insertNewObjectForEntityForName:@"Website" inManagedObjectContext:managedObjectContext];
	self.website.url=url.text;
	self.website.login=login.text;
	[delegate addViewControllerDidFinish:self];    
}

- (void) _style_textField:(UITextField *)_textField {
	_textField.layer.cornerRadius = 8.0f;
	_textField.layer.shadowOpacity = 1.0;
	_textField.layer.shadowRadius = 0.0;
	_textField.layer.shadowColor = [UIColor whiteColor].CGColor;  
	_textField.layer.shadowOffset = CGSizeMake(0.0, 1.0);
}

- (void)viewDidLoad {
	[self _style_textField: url];
	[self _style_textField: login];
	doneButton.enabled=NO;
}

- (IBAction)urlChanged:(id)sender {
	if (([url.text length] == 0) ||
		[url.text isEqualToString:@"domain name"]) {
		doneButton.enabled=NO;
	} else {
		doneButton.enabled=YES;
	}
}

#pragma mark textField_returns

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
