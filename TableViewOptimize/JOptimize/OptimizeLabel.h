//
//  OptimizeLabel.h
//  YDSC
//
//  Created by lu ddong on 10/25/11.
//  Copyright 2011 TwinFish Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptimizeLabel : UIView {
 @private
    NSString *text_;
    UIColor *textColor_;
    UIFont *font_;
    UITextAlignment textAlignment_;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) UITextAlignment textAlignment;

- (CGFloat)heightToFit;
+ (float)calculateTotalHeightOfText:(NSString *)aText withWidth:(float)width withFont:(UIFont *)font withLineBreakMode:(UILineBreakMode)lineBreakMode;

@end
