//
//  DetailTableViewDataSource.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailTableViewDataSource.h"
#import "Project.h"
#import "Entry.h"

static NSString *detailCellID = @"detailCellID";

@implementation DetailTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellID];
    
    if (!cell)
    {
        cell = [UITableViewCell new];
    }
    
    Entry *entry = self.project.entries[indexPath.row];
    
    /*NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    
    NSDate *now = [[NSDate alloc] init];
    
    NSString *theDate = [dateFormat stringFromDate:now];
    NSString *theTime = [timeFormat stringFromDate:now];
    
    NSLog(@"\n"
          "theDate: |%@| \n"
          "theTime: |%@| \n"
          , theDate, theTime);
    
    [dateFormat release];
    [timeFormat release];
    [now release];*/
    
    NSDateFormatter *nsDateFmt = [[NSDateFormatter alloc] init];
    [nsDateFmt setDateFormat:@"MM/dd HH:mm:ss"];
    
    NSString *startDateString = [nsDateFmt stringFromDate:entry.startDate];
    //NSDate *endDate = [[NSDate alloc] initWithTimeInterval:entry.durationInSeconds sinceDate:entry.startDate];
    NSString *endDateString = [nsDateFmt stringFromDate:entry.endDate];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ | %@", startDateString, endDateString];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.project.entries count];
}


@end
