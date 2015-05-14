//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

@implementation ProjectController

+ (instancetype) sharedInstance
{
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectController alloc] init];
        sharedInstance.projectArray = [NSMutableArray new];
        Project *newProject = [Project new];
        newProject.title = @"Test New Project Title";
        [sharedInstance addProject:newProject];
    });
    return sharedInstance;
}

-(void)addProject:(Project *)project
{
    [self.projectArray addObject:project];
}

-(void)removeProject:(Project *)project
{
    [self.projectArray removeObject:project];
}

-(void)saveToPersistentStorage
{
    
}

-(void)loadFromPersistentStorage
{
    
}

@end
