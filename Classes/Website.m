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
	NSURL *lurl;
	if (range.location == NSNotFound) {
		lurl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@", aUrlString]];
	} else {
		lurl = [[NSURL alloc] initWithString:aUrlString];
	}
	
	
	if (! lurl) {
		NSLog(@"domainName: not an url");		
		[lurl release];
		return aUrlString;
	}
	
	NSString *host=lurl.host;
	NSArray *components=[host componentsSeparatedByString:@"."];
    // [lurl autorelease];
	if (components.count > 1) {
		return [NSString stringWithFormat:@"%@.%@",[components objectAtIndex:components.count-2], [components objectAtIndex:components.count-1]];		
	} else {
		return aUrlString;
	}
}

@end
