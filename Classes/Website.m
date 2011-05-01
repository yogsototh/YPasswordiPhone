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

// Private method that return an NSURL from the url NSString
- (NSURL *) urlObject {
    // Verify it it contains at least one dot
    NSRange range;
    range = [self.url rangeOfString:@"."];
    if (range.location == NSNotFound) {
        return nil;
    }
    // Verify if it contains ://
    range = [self.url rangeOfString:@"://"];
	NSString *aUrlString;
    if (range.location == NSNotFound) {
		aUrlString = [NSString stringWithFormat:@"http://%@", self.url];
	} else {
		aUrlString = self.url;
	}
    
    return [NSURL URLWithString:aUrlString];
}

// Return the domainName of a string
- (NSString *)domainName {
    NSURL *lurl = [self urlObject];
	if (! lurl) {
		return self.url;
	}
	
	NSString *host=lurl.host;
	NSArray *components=[host componentsSeparatedByString:@"."];
    if (components.count > 1) {
		return [NSString stringWithFormat:@"%@.%@",
                [components objectAtIndex:components.count-2], 
                [components objectAtIndex:components.count-1]];
	} else {
		return self.url;
	}
}

- (BOOL) isRealWebsite {
    return ([self urlObject] != nil);
}

@end
