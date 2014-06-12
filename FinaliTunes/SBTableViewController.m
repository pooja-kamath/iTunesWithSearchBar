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
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

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
    self.searchBar.delegate=self;
    
  }
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    
    [self startSearch:searchBar.text];
    //[self resignFirstResponder];
}


- (void)startSearch:(NSString *)searchString
{
       SBdata *data=[[SBdata alloc]init];
    moviesArray=[[NSMutableArray alloc]initWithArray:[data getDatawithString:searchString]];
    [self.tableView reloadData];
    [data release];

}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
   [self startSearch:searchBar.text];
    
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
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
    NSData *imgdata = [NSData dataWithContentsOfURL:url];
    UIImage *img=[[UIImage alloc]initWithData:imgdata];
//    cell.imageView.image = [[UIImage alloc] initWithData:imgdata];
    [cell.image setImage:img];
    [url release];
   

    return cell;
}


- (void)dealloc {
 
    [_searchBar release];
    [super dealloc];
}
@end
