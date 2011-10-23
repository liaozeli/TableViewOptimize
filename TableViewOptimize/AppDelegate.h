//
//  AppDelegate.h
//  TableViewOptimize
//
//  Created by jimmy liao on 10/23/11.
//  Copyright (c) 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *navigationController_;
    TFTableViewController *tableViewController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) TFTableViewController *tableViewController;

@end
