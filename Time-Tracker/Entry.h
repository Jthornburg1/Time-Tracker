//
//  Entry.h
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
//@property (nonatomic) int durationInSeconds;

-(NSDictionary *)toDictionary;
-(Entry *)toEntry:(NSDictionary *)dict;
//-(void)saveToPersistentStorage;
//-(void)loadFromPersistentStorage;

@end
