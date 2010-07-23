//
//  WebsiteListTableViewController.m
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebsiteListTableViewController.h"
#import "Website.h"


@implementation WebsiteListTableViewController
@synthesize managedObjectContext;

- (IBAction)add:(id)sender {
    NSLog(@"WebsiteListTableViewController::add");
}

- (IBAction)edit:(id)sender {
    NSLog(@"WebsiteListTableViewController::edit");
}

#pragma mark initialisation

- (void)viewDidLoad {
	managedObjectContext = [websiteListViewController managedObjectContext];
}

#pragma mark UITableViewDataSource
// required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

// required
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}


@end
