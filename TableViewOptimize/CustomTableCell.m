//
//  CostumCell.m
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell 

@synthesize cellImage1 = cellImage1_;
@synthesize cellImage2 = cellImage2_;
@synthesize cellTitle = cellTitle_;

- (void)drawContentView:(CGRect)rect 
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *backgroundColor = [UIColor clearColor];
    [backgroundColor set];
    CGContextFillRect(context, rect);
    cellImage1_ = [UIImage imageNamed:@"j.jpg"];
    
    [cellImage1_ drawInRect:CGRectMake(10, 7, 30, 30)];
    cellImage2_ = [UIImage imageNamed:@"Front.jpg"];
    [cellImage2_ drawInRect:CGRectMake(50, 7, 30, 30)];
    
    [cellImage1_ drawInRect:CGRectMake(100, 7, 30, 30)];
    [cellImage2_ drawInRect:CGRectMake(150, 7, 30, 30)];
    
    UIColor *textColor = [UIColor blackColor];
    [textColor set];
    cellTitle_ = @"Twin-Fish Tech";
    [cellTitle_ drawAtPoint:CGPointMake(200, 7) forWidth:120.0f withFont:[UIFont systemFontOfSize:16.0f] lineBreakMode:UILineBreakModeWordWrap];
}

@end
