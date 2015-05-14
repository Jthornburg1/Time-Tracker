//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "Project.h"
#import "Entry.h"
#import "CustomEntryViewController.h"
#import "DetailTableViewDataSource.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.dataSource = [DetailTableViewDataSource new];
        //self.tableView = [UITableView new];
        //self.tableView.frame = self.view.frame;
        //self.tableView.dataSource = (id)self.dataSource;
        //self.dataSource.project = self.project;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.dataSource = (id)self.project;
    self.dataSource.project = self.project;
    self.tableView.delegate = self.dataSource;
    NSLog(@"checkpoint");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
    self.titleTextField.text = self.project.title;
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
    
    mailVC.delegate = self;
    mailVC.mailComposeDelegate = self;
    
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


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"got here");
    return 0;
}

@end
