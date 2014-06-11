//
//  SBdata.h
//  FinaliTunes
//
//  Created by Pooja Kamath on 11/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBdata : NSObject
@property (nonatomic, retain) NSArray *moviesArray;
-(NSArray *)getData;
@end
