//
//  WebsiteListViewController.m
//
//  Created by Yann Esposito on 19/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebsiteListViewController.h"

@implementation WebsiteListViewController

@synthesize delegate;
@synthesize managedObjectContext;
@synthesize websitesArray;

-(void)viewDidUnload {
	self.websitesArray=nil;
}
-(void)dealloc {
	[websitesArray release];
	[super dealloc];
}

#pragma mark Actions

- (IBAction)add:(id)sender {
    NSLog(@"add");
}

- (IBAction)cancel:(id)sender {
    NSLog(@"cancel");
	[self.delegate websiteViewControllerDidFinish:self];
}

#pragma mark TableView Datasource

#pragma mark TableView Delegate

@end
