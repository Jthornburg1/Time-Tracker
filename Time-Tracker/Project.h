//
//  Project.h
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Project : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *entries;
@property (nonatomic, strong) Entry *currentEntry;

-(void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;
-(NSDictionary *)toArrayOfDictionaries;
-(Project *)toProject:(NSArray *)arr;
-(void)startNewEntry;
-(void)endCurrentEntry;

@end
