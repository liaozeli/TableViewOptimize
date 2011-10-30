//
//  OptimizeTableCell.h
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptimizeTableCellView.h"

@interface OptimizeTableCell : UITableViewCell {
    OptimizeTableCellView *contentView_;
}

- (void)drawContentView:(CGRect)rect; // subclasses should implement

@end
