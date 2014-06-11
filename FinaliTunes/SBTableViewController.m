//
//  SBTableViewController.m
//  FinaliTunes
//
//  Created by Pooja Kamath on 11/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewController.h"
#import "SBTableViewCell.h"
#import "SBdata.h"
@interface SBTableViewController ()
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SBTableViewController
@synthesize moviesArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
          }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.tableView registerClass:[SBTableViewCell class] forCellReuseIdentifier:@"SimpleTableItems"];
    SBdata *data=[[SBdata alloc]init];
   moviesArray=[[NSArray alloc]initWithArray:[data getData]];
    
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return moviesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBTableViewCell *cell =  cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableItems"];
  
    NSDictionary *movieDictionary = [moviesArray objectAtIndex:indexPath.row];
    cell.trackNameLabel.text=[movieDictionary objectForKey:@"trackName"];
    
    cell.collectionNameLabel.text=[movieDictionary objectForKey:@"collectionName"];
    
    //cell.priceLabel.text=[movieDictionary objectForKey:@"trackPrice"];
       cell.artistNameLabel.text=[movieDictionary objectForKey:@"artistName"];
    
    NSURL *url = [[NSURL alloc] initWithString:[movieDictionary objectForKey:@"artworkUrl100"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [[UIImage alloc] initWithData:data];

    return cell;
}


- (void)dealloc {
 
    [super dealloc];
}
@end
