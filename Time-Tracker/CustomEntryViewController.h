//
//  CustomEntryViewController.h
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface CustomEntryViewController : UIViewController

@property (nonatomic, strong) Project *project;


-(IBAction)cancel;
-(IBAction)save;

@end
