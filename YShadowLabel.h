//
//  YShadowLabel.h
//  YPassword
//
//  Created by Yann Esposito on 26/09/10.
//  Copyright 2010 yannesposito. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YShadowLabel : UILabel {
	NSNumber *blurRadius;
}

@property (nonatomic, retain) NSNumber *blurRadius;

@end
