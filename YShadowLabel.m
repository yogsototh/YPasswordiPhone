//
//  YShadowLabel.m
//  YPassword
//
//  Created by Yann Esposito on 26/09/10.
//  Copyright 2010 yannesposito. All rights reserved.
//

#import "YShadowLabel.h"


@implementation YShadowLabel

@synthesize blurRadius;

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.blurRadius = [NSNumber numberWithFloat:5.0];
    }
    return self;
}

- (void)awakeFromNib {
	// Initialization code
	self.blurRadius = [NSNumber numberWithFloat:5.0];
}

- (void) drawTextInRect:(CGRect)rect {
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(myContext);
	
    CGContextSetShadow (myContext, self.shadowOffset, 1);
    CGColorSpaceRef myColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef myColor = [self.shadowColor CGColor];
    CGContextSetShadowWithColor (myContext, self.shadowOffset, (CGFloat)[self.blurRadius floatValue], myColor);
	
    [super drawTextInRect:rect];
	
    CGColorSpaceRelease(myColorSpace); 
	
    CGContextRestoreGState(myContext);
}


- (void)dealloc {
    [super dealloc];
}


@end
