//
//  Entry.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(NSDictionary *)toDictionary
{
    return @{@"startDate":self.startDate, @"endDate":self.endDate};
}

-(Entry *)toEntry:(NSDictionary *)dict
{
    Entry *returnEntry = [Entry new];
    returnEntry.startDate=[dict valueForKey:@"startDate"];
    returnEntry.endDate=[dict valueForKey:@"endDate"];
    
    return returnEntry;
}

@end
