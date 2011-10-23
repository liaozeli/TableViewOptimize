//
//  TableViewController.h
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
}

@property (nonatomic, strong) UITableView *tableView;

@end
