//
//  OptimizeLabel.m
//  YDSC
//
//  Created by jimmy liao on 10/25/11.
//  Copyright 2011 TwinFish Technology Co., Ltd. All rights reserved.
//

#import "OptimizeLabel.h"

@implementation OptimizeLabel
@synthesize text = text_;
@synthesize textColor = textColor_;
@synthesize font = font_;
@synthesize textAlignment = textAlignment_;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        textAlignment_ = UITextAlignmentLeft;
        font_ = [UIFont fontWithName:@"Helvetica" size:17];
        textColor_ = [UIColor blackColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        textAlignment_ = UITextAlignmentLeft;
        font_ = [UIFont fontWithName:@"Helvetica" size:17];
        textColor_ = [UIColor blackColor];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        textAlignment_ = UITextAlignmentLeft;
        font_ = [UIFont fontWithName:@"Helvetica" size:17];
        textColor_ = [UIColor blackColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {

    text_ = text;
    [self setNeedsDisplay];
    
}

- (void)setTextColor:(UIColor *)textColor {
    textColor_ = textColor;
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    font_ = font;
    [self setNeedsDisplay];
}

- (void)setTextAlignment:(UITextAlignment)textAlignment {
    if (textAlignment_ != textAlignment) {
        textAlignment_ = textAlignment;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    if (!text_) {
        return;
    }
    [[UIColor blackColor] setFill];
    [text_ drawInRect:rect withFont:font_ lineBreakMode:UILineBreakModeCharacterWrap alignment:textAlignment_];
}

- (CGFloat)heightToFit {
    if (text_) {
        CGSize constrainedSize = CGSizeMake(self.frame.size.width, 100000.0);
        CGSize textSize = [text_ sizeWithFont:font_ constrainedToSize:constrainedSize lineBreakMode:UILineBreakModeCharacterWrap];
        
        CGRect frame = self.frame;
        frame.size = CGSizeMake(frame.size.width, textSize.height);
        self.frame = frame;
        
        return textSize.height;
    }
    return 0.0f;
}

+ (float)calculateTotalHeightOfText:(NSString *)aText withWidth:(float)width withFont:(UIFont *)font withLineBreakMode:(UILineBreakMode)lineBreakMode {
	CGSize constrainedSize = CGSizeMake(width, 100000.0);
	CGSize textSize = [aText sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
	
	return textSize.height;
}

@end
