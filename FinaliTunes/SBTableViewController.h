//
//  SBTableViewController.h
//  FinaliTunes
//
//  Created by Pooja Kamath on 11/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBTableViewCell.h"
@interface SBTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (assign) NSArray *moviesArray;
@end
