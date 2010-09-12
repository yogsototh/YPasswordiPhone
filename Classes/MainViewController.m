//
//  MainViewController.m
//  YPassword
//
//  Created by Yann Esposito on 14/07/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MainViewController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MainViewController

@synthesize managedObjectContext;
@synthesize website;
@synthesize masterPassword;


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)viewDidAppear:(BOOL)animated {
	if (!masterPassword) {
		[self showInfo:self];
	}
}

- (NSMutableArray *)arrayOfWebsites {
	// ----------------------------
	// Create a request of Websites contained in the managedObjectContext
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Website" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
	
	// sort the result by url name
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"url" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptors release];
	[sortDescriptor release];
	
	// Execute the request
	NSError *error;
	NSMutableArray *mutableFetchResults=[[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	return mutableFetchResults;
}

- (NSUInteger)indexOfCurrentWebsite {
	if (website == nil) {
		return 0;
	}
	NSMutableArray *websitesArray=[self arrayOfWebsites];
	return [websitesArray indexOfObject:website];
}

 // Implement viewWillAppear: to do additional setup before the view is presented. You might, for example, fetch objects from the managed object context if necessary.
- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"MainViewController::viewWillAppear");
	[detailViewButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
	[selectWebsiteButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

	if (masterPassword == nil) {
		masterPassword=[[NSUserDefaults standardUserDefaults] objectForKey:@"masterPassword"];
	}
	
	if (website == nil) {
		NSMutableArray *mutableFetchResults=[self arrayOfWebsites];
		if ([mutableFetchResults count] == 0) {
			[selectWebsiteButton setEnabled:NO];
		} else {
			[selectWebsiteButton setEnabled:YES];
			int lastIndex=[[NSUserDefaults standardUserDefaults] integerForKey:@"lastSelectedIndex"];
			// NSLog(@"[user default] selectedIndex = %@",[NSNumber numberWithInt:lastIndex]);
			website = [mutableFetchResults objectAtIndex:lastIndex];
		}
	} else {
		[selectWebsiteButton setEnabled:YES];
	}

	
	// ----------------------------
	
	if ([self website] != nil) {
		NSLog(@"  website in delegate: %@, %@", website.url, website.login);
		[urlLabel setText:website.url];
		[loginLabel setText:website.login];
		[detailViewButton setEnabled:YES];
		[self updatePassword];
	} else {
		[urlLabel setText:@"URL"];
		[loginLabel setText:@"username"];
		[detailViewButton setEnabled:NO];
	}

    [super viewWillAppear:animated];
}

- (unsigned char *)sha1:(NSString *)baseString result:(unsigned char *)result {
	char *c_baseString=(char *)[baseString UTF8String];
	CC_SHA1(c_baseString, strlen(c_baseString), result);
	return result;
}

- (NSString *)base64:(unsigned char *)result {
	NSString *password=[[NSString alloc] init];
	static const unsigned char cb64[65]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i+=3) {
		password=[password stringByAppendingFormat:@"%c%c%c%c",
				  cb64[(result[i] &0xFC)>>2],
				  cb64[((result[i] & 0x03) << 4)
					   | ((result[i + 1] & 0xF0) >> 4)],
				  cb64[((result[i + 1] & 0x0F) << 2)
					   | ((result[i + 2] & 0xC0) >> 6)],
				  cb64[result[i+2]&0x3F]
				  ];			
	}
	return password;
}

- (NSString *)hexadecimalRepresentation:(unsigned char *)result {
	NSString *password=[[NSString alloc] init];
	for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
		password=[password stringByAppendingFormat:@"%02x", result[i]];
	}
	return password;
}

- (NSString *)b64_sha1:(NSString *)inputString {
	unsigned char result[CC_SHA1_DIGEST_LENGTH+1];
	[self sha1:inputString result:result];
	return [self base64:result];
}

- (NSString *)hex_sha1:(NSString *)inputString {
	unsigned char result[CC_SHA1_DIGEST_LENGTH+1];
	[self sha1:inputString result:result];
	return [self hexadecimalRepresentation:result];
}

- (void)updatePassword {
	NSString *baseString;
	// notice by construction masterPassword is not null
	// when entering this function
    NSLog(@" [mainViewController::updatePassword] ==> website = %@, %@, %@, %@, %@", website.url, website.login, (website.base64==[NSNumber numberWithBool:YES])?@"base64":@"base16", website.passwordLength, website.passwordNumber);

	baseString=[NSString stringWithFormat:@"%@%@%@",masterPassword, 
				[website.passwordNumber intValue]?[website.passwordNumber stringValue]:@"", website.domainName];
	NSLog(@"Update Password baseString = %@",baseString);

	NSString *password;
	NSLog(@"Update Password website.base64 = %@ %@",website.base64, [NSNumber numberWithBool:YES]);
	if ([website.base64 isEqualToNumber:[NSNumber numberWithBool:YES]]) {
		NSLog(@"b64");
		password=[self b64_sha1:baseString];
	} else {
		NSLog(@"b16");
		password=[self hex_sha1:baseString];
	}
	password=[password substringToIndex:MIN([website.passwordLength intValue],[password length])];
	
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	pasteboard.string = password;
	
	[self displayCopiedAnimation];

	[passwordLabel setText:password];
}

- (void) displayCopiedAnimation {
	
}

// Filpside view
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)showInfo:(id)sender {    
    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (int) save {
	NSError *error;
	if (![managedObjectContext save:&error]) {
		NSLog(@"ERROR : save error : DetailViewController::next");
		return -1;
	} else {
        NSLog(@"saved: %@ %@ %@ len: %@ num: %@", website.url, website.login, (website.base64 == [NSNumber numberWithBool:YES])?@"base64":@"base16", website.passwordLength, website.passwordNumber);
		return 0;
	}
}

// Add a new website
- (IBAction)addWebsite:(id)sender {
	Website *newWebsite=(Website *)[NSEntityDescription insertNewObjectForEntityForName:@"Website" inManagedObjectContext:managedObjectContext];
	newWebsite.url=@"new.com";
	newWebsite.login=@"username";
	self.website=newWebsite;
    [self save];
	
	[self adjustProperties:self];
}

// Modal view for details
- (void)detailViewControllerDidFinish:(DetailViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
	[[NSUserDefaults standardUserDefaults] setInteger:[self indexOfCurrentWebsite] forKey:@"lastSelectedIndex"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}
- (IBAction)adjustProperties:(id)sender {
    DetailViewController *controller = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
	controller.delegate = self;
	controller.website = website;
	controller.managedObjectContext=managedObjectContext;

	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:controller animated:YES];

	[controller release];
}

// Choose website
- (void)websiteListViewControllerDidFinish:(WebsiteListViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)chooseWebsite:(id)sender {
    WebsiteListViewController *controller = [[WebsiteListViewController alloc] initWithNibName:@"WebsiteListView" bundle:nil];
	controller.delegate = self;
	controller.managedObjectContext=managedObjectContext;
	
	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


#pragma mark standard

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}


- (void)dealloc {
    [managedObjectContext release];
    [super dealloc];
}


@end
