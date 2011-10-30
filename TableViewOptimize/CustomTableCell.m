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
    UIColor *backgroundColor = [UIColor clearColor];
    [backgroundColor set];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        cellImage1_ = [[OptimizeImageView alloc] initWithFrame:CGRectMake(10, 7, 30, 30)];
        cellImage1_.image = [UIImage imageNamed:@"j.jpg"];
        cellImage2_ = [[OptimizeImageView alloc] initWithFrame:CGRectMake(50, 7, 30, 30)];
        cellImage2_.image = [UIImage imageNamed:@"Front.jpg"];
        cellTitle_ = [[OptimizeLabel alloc] initWithFrame:CGRectMake(200, 0, 100, 30)];
        cellTitle_.text = @"Twin-Fish Tech";
        cellTitle_.font = [UIFont systemFontOfSize:14];
        [self addSubview:cellTitle_];
        [self addSubview:cellImage1_];
        [self addSubview:cellImage2_];
    }
    return self;
}

@end
