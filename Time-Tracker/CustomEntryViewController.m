//
//  CustomEntryViewController.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomEntryViewController.h"
#import "Entry.h"

@interface CustomEntryViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;

@end

@implementation CustomEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)save {
    Entry *entry = [Entry new];
    
    entry.startDate = self.startDatePicker.date;
    entry.endDate   = self.endDatePicker.date;
    
    [self.project addEntry:entry];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
