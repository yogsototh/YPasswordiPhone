// 
//  Website.m
//  YPassword
//
//  Created by Yann Esposito on 18/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Website.h"


@implementation Website 

@dynamic login;
@dynamic base64;
@dynamic url;
@dynamic passwordLength;
@dynamic passwordNumber;


// Return the domainName of a string
- (NSString *)domainName {
	NSString *aUrlString=self.url;
	NSString *searchSubstring = @"://";
	NSRange range = [aUrlString rangeOfString : searchSubstring];
	NSURL *url;
	if (range.location == NSNotFound) {
		url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@", aUrlString]];
	} else {
		url = [[NSURL alloc] initWithString:aUrlString];
	}
	
	
	if (! url) {
		NSLog(@"domainName: not an url");		
		[url release];
		return aUrlString;
	}
	
	NSString *host=url.host;
	NSArray *components=[host componentsSeparatedByString:@"."];
    [url autorelease];
	if (components.count > 1) {
		return [NSString stringWithFormat:@"%@.%@",[components objectAtIndex:components.count-2], [components objectAtIndex:components.count-1]];		
	} else {
		return aUrlString;
	}
}

@end
