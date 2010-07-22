//
//  WebsiteListTableViewController.h
//
//  Created by Yann Esposito on 23/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface WebsiteListTableViewController : UITableViewController {
    IBOutlet id websiteListViewController;
}
- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;
@end
