//
//  WebsiteListViewController.m
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebsiteListViewController.h"
#import "WebsiteListNavigationController.h"

@implementation WebsiteListViewController

- (void)viewDidLoad {
	[self.view addSubview:[navigationController view]];
}

@end
