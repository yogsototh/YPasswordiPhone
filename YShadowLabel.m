//
//  YShadowLabel.m
//  YPassword
//
//  Created by Yann Esposito on 26/09/10.
//  Copyright 2010 yannesposito. All rights reserved.
//

#import "YShadowLabel.h"


@implementation YShadowLabel


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void) drawTextInRect:(CGRect)rect {
    CGSize myShadowOffset = CGSizeMake(0, 0);
    float myColorValues[] = {0.4, 1.0, 1.0, .8};
	
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(myContext);
	
    CGContextSetShadow (myContext, myShadowOffset, 1);
    CGColorSpaceRef myColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef myColor = CGColorCreate(myColorSpace, myColorValues);
    CGContextSetShadowWithColor (myContext, myShadowOffset, 5, myColor);
	
    [super drawTextInRect:rect];
	
    CGColorRelease(myColor);
    CGColorSpaceRelease(myColorSpace); 
	
    CGContextRestoreGState(myContext);
}


- (void)dealloc {
    [super dealloc];
}


@end
