//
//  CostumCell.h
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptimizeTableCell.h"
#import "OptimizeLabel.h"
#import "OptimizeImageView.h"

@interface CustomTableCell : OptimizeTableCell {
    OptimizeImageView *cellImage1_;
    OptimizeImageView *cellImage2_;
    OptimizeLabel *cellTitle_;
}

@property (nonatomic, strong) OptimizeImageView *cellImage1;
@property (nonatomic, strong) OptimizeImageView *cellImage2;
@property (nonatomic, strong) OptimizeLabel *cellTitle;

@end
