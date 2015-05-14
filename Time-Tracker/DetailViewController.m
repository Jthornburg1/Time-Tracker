//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "Project.h"
#import "CustomEntryViewController.h"
#import <MessageUI/MessageUI.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.dataSource = [DetailTableViewDataSource new];
        self.tableView.dataSource = (id)self.dataSource;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataSource = (id)self.project;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addBBM
{
    CustomEntryViewController *cevc = [CustomEntryViewController new];
    
    cevc.project = self.project;
    
    //[self.navigationController pushViewController:cevc animated:YES];
    [self presentViewController:cevc animated:YES completion:nil];
}

- (IBAction)clockInBBM
{
    [self.project startNewEntry];
    [self.tableView reloadData];
}

- (IBAction)clockOutBBM
{
    [self.project endCurrentEntry];
    [self.tableView reloadData];
}

- (IBAction)reportBBM
{
    MFMailComposeViewController *mailVC = [MFMailComposeViewController new];
    
    NSMutableString *mutStr;
    for (Entry *entry in self.project.entries)
    {
        NSDateFormatter *dateFmt = [NSDateFormatter new];
        
        NSString *startStr = [dateFmt stringFromDate:entry.startDate];
        NSString *endStr = [dateFmt stringFromDate:entry.endDate];
        
        [mutStr appendString:startStr];
        [mutStr appendString:endStr];
    }
    [mailVC setMessageBody:(NSString *)mutStr isHTML:YES];
    [self presentViewController:mailVC animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.project.title = textField.text;
    return YES;
}

@end
