//
//  SBdata.m
//  FinaliTunes
//
//  Created by Pooja Kamath on 11/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBdata.h"

@implementation SBdata
@synthesize moviesArray;
-(NSArray *)getData
{

    
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo"]];
    
    return[self fetchedData:data];
    
}
- (NSArray *)fetchedData:(NSData *)responseData
{
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    moviesArray = [json objectForKey:@"results"];
    return moviesArray;
}
@end
