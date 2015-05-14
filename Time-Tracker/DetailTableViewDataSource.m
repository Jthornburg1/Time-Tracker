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
        Entry *entry = self.project.entries[indexPath.row];
        
        NSDateFormatter *nsDateFmt = [NSDateFormatter new];
        NSString *startDateString = [nsDateFmt stringFromDate:entry.startDate];
        //NSDate *endDate = [[NSDate alloc] initWithTimeInterval:entry.durationInSeconds sinceDate:entry.startDate];
        NSDate *endDate = entry.endDate;
        NSString *endDateString = [nsDateFmt stringFromDate:endDate];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", startDateString, endDateString];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.project.entries count];
}


@end
