//
//  YRoundedButton.m
//  YPassword
//
//  Created by Yann Esposito on 23/09/10.
//  Copyright 2010 yannesposito. All rights reserved.
//

#import "YRoundedButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation YRoundedButton

@synthesize topColor;
@synthesize bottomColor;
@synthesize gradientLayer;

-(void) awakeFromNib 
{
	NSLog(@"YRoundedButton awakeFromNib");
	gradientLayer=[[CAGradientLayer alloc] init];
	[gradientLayer setBounds:[self bounds]];
	[gradientLayer setPosition:CGPointMake([self bounds].size.width/2, [self bounds].size.height/2)];	
	[[self layer] insertSublayer:gradientLayer atIndex:0];
	[[self layer] setBorderColor:[[[UIColor blackColor] colorWithAlphaComponent:.7] CGColor]];
	[[self layer] setCornerRadius: 4.0f];
	[[self layer] setMasksToBounds:YES];
	[[self layer] setBorderWidth:1.0f];

}

-(void)drawRect:(CGRect)rect
{
	if (topColor && bottomColor) {
		NSLog(@"topColor and bottomColor setted");
		[gradientLayer setColors:
		 [NSArray arrayWithObjects:(id)[topColor CGColor], 
								(id)[bottomColor CGColor], nil]];
	} else {
		[self setTopColor      : [[UIColor darkGrayColor] colorWithAlphaComponent:.5] ];
		[self setBottomColor   : [[UIColor blackColor]  colorWithAlphaComponent:.5] ];
		[gradientLayer setColors:
		 [NSArray arrayWithObjects:(id)[topColor CGColor], 
		  (id)[bottomColor CGColor], nil]];
	}

	[super drawRect:rect];
		
}

-(void)setTopColor:(UIColor *)aColor
{
	if (topColor == aColor) {
		return;
	}
	topColor = aColor;
	[topColor retain];
	[[self layer] setNeedsDisplay];
}

-(void)setBottomColor:(UIColor *)aColor
{
	if (bottomColor == aColor) {
		return;
	}
	bottomColor = aColor;
	[bottomColor retain];
	[[self layer] setNeedsDisplay];
}

-(void)dealloc {
	[gradientLayer release];
	[super dealloc];
}

@end
