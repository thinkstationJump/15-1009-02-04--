//
//  TodayViewController.m
//  todayE-test
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    NSLog(@"%s, line = %d, completionHandler = %@", __FUNCTION__, __LINE__, completionHandler);
    completionHandler(NCUpdateResultNewData);
    NSLog(@"%s, line = %d, completionHandler = %@", __FUNCTION__, __LINE__, completionHandler);
}

@end
