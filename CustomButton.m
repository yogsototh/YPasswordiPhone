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
-(void) awakeFromNib {
	[[self layer] setCornerRadius: 8.0f];
}
@end
