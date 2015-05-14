//
//  Project.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"

@implementation Project

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.entries = [NSMutableArray new];
    }
    return self;
}

-(void)addEntry:(Entry *)entry
{
    [self.entries addObject:entry];
}

-(void)removeEntry:(Entry *)entry
{
    [self.entries removeObject:entry];
}


-(Project *)toProject:(NSArray *)arr
{
    Project *project = [Project new];
    for (NSDictionary *dict in arr) {
        Entry *entry = [Entry new];
        [project.entries addObject:[entry toEntry:dict]];
    }
    return project;
}

-(NSArray *)toArrayOfDictionaries
{
    NSMutableArray *tempMutArr = [NSMutableArray new];
    
    for (Entry *entry in self.entries)
    {
        [tempMutArr addObject:[entry toDictionary]];
    }
    return tempMutArr;
}

-(void)startNewEntry {
    Entry *newEntry = [Entry new];
    newEntry.startDate = [NSDate date];
    //[self addEntry:newEntry];
    self.currentEntry = newEntry;
}

-(void)endCurrentEntry {
    self.currentEntry.endDate = [NSDate date];
}

@end
