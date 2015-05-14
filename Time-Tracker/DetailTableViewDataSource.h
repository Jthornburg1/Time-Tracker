//
//  DetailTableViewDataSource.h
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface DetailTableViewDataSource : NSObject

@property (nonatomic, strong) Project *project;

@end
