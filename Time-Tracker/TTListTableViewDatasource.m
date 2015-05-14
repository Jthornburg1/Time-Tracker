//
//  TTListTableViewDatasource.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListTableViewDatasource.h"
#import "ProjectController.h"
#import "Project.h"

static NSString *cellID = @"cellID";

@implementation TTListTableViewDatasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [UITableViewCell new];
        ProjectController *projectController = [ProjectController sharedInstance];
        NSArray *projectArr = projectController.projectArray;
        Project *project = projectArr[indexPath.row];
        cell.textLabel.text = project.title;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ProjectController *projectController = [ProjectController sharedInstance];
    NSArray *projectArr = projectController.projectArray;
    return [projectArr count];
}

@end
