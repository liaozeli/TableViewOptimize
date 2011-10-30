//
//  OptimizeTableCellView.m
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import "OptimizeTableCellView.h"
#import "OptimizeTableCell.h"

@implementation OptimizeTableCellView

@synthesize highlighted = highlighted_;

- (void)drawRect:(CGRect)rect {
    [(OptimizeTableCell *)[self superview] drawContentView:rect];
}

- (void)setHighlighted:(BOOL)newValue {
	// when touched cell
    highlighted_ = newValue;
    [self setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame {
	// when pushed edit button 
    [super setFrame:frame];
    [self setNeedsDisplay];
}

@end
