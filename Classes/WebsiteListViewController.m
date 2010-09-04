//
//  WebsiteListViewController.m
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebsiteListViewController.h"
#import "WebsiteListNavigationController.h"

@implementation WebsiteListViewController
@synthesize delegate;
@synthesize managedObjectContext;
- (void)viewDidLoad {
	[self.view addSubview:[navigationController view]];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	// return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end
