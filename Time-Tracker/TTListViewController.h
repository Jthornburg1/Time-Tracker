//
//  TTListViewController.h
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTListTableViewDatasource.h"

@interface TTListViewController : UIViewController <UITableViewDelegate>

@property (nonatomic, strong) TTListTableViewDatasource *dataSource;

@property (nonatomic, strong) UITableView *tableView;

- (instancetype)init;

@end
