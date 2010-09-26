//
//  YRoundedButton.h
//  YPassword
//
//  Created by Yann Esposito on 23/09/10.
//  Copyright 2010 yannesposito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface YRoundedButton : UIButton {
	
	UIColor *topColor;
	UIColor *bottomColor;
	CAGradientLayer *gradientLayer;
	
}

@property (nonatomic, retain) UIColor *topColor;
@property (nonatomic, retain) UIColor *bottomColor;
@property (nonatomic, retain) CAGradientLayer *gradientLayer;

-(void)setTopColor:(UIColor *)aColor;
-(void)setBottomColor:(UIColor *)aColor;

@end
