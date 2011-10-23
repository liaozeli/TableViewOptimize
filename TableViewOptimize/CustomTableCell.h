//
//  CostumCell.h
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptimizeTableCell.h"

@interface CustomTableCell : OptimizeTableCell {
    UIImage *cellImage1_;
    UIImage *cellImage2_;
    NSString *cellTitle_;
}

@property (nonatomic, strong) UIImage *cellImage1;
@property (nonatomic, strong) UIImage *cellImage2;
@property (nonatomic, copy) NSString *cellTitle;

@end
