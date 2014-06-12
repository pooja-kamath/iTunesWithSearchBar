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

-(NSArray *)getDatawithString:(NSString *)searchString
{

    NSString * initialString=@"https://itunes.apple.com/search?term=";
   // NSString *appendingString=[_searchText.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"%@",appendingString);
     NSString *lastString=@"&entity=musicVideo";
    searchString=[searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
   NSString *searchUrl=[initialString stringByAppendingString:searchString];
    searchUrl=[searchUrl stringByAppendingString:lastString];
   
    NSLog(@"%@",searchUrl);
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:searchUrl]];
    
    return[self fetchedData:data];
  
}
- (NSArray *)fetchedData:(NSData *)responseData
{
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    moviesArray = [json objectForKey:@"results"];
    NSLog(@"%@",moviesArray);
    return moviesArray;
   
   }
@end
