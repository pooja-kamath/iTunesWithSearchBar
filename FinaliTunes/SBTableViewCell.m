//
//  SBTableViewCell.m
//  FinaliTunes
//
//  Created by Pooja Kamath on 11/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewCell.h"

@implementation SBTableViewCell
@synthesize artistNameLabel;
@synthesize trackNameLabel;
@synthesize collectionNameLabel;
@synthesize priceLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
 
        CGRect TrackNameLabelFrame = CGRectMake( 180, 5, 100, 30 );
       trackNameLabel = [[UILabel alloc] initWithFrame: TrackNameLabelFrame];
        [trackNameLabel setTextAlignment:NSTextAlignmentCenter];
        [trackNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview: trackNameLabel];
        
        
        CGRect collectionNameLabelFrame = CGRectMake(120, 30, 200, 15);
         collectionNameLabel = [[UILabel alloc] initWithFrame: collectionNameLabelFrame];
        collectionNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [collectionNameLabel setTextAlignment:NSTextAlignmentCenter];
        [collectionNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:collectionNameLabel];
        
        
        
        CGRect priceLabelFrame = CGRectMake(120, 80,50, 15);
        priceLabel = [[UILabel alloc] initWithFrame: priceLabelFrame];
        priceLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [priceLabel setTextAlignment:NSTextAlignmentCenter];
        [priceLabel setText: @"My " ];
        [priceLabel setTextColor: [UIColor blackColor]];
        [self addSubview:priceLabel];
        
        
        CGRect artistNameLabelFrame = CGRectMake(priceLabelFrame.origin.x+priceLabelFrame.size.width+5, 80,150, 15);
        artistNameLabel = [[UILabel alloc] initWithFrame: artistNameLabelFrame];
        artistNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [artistNameLabel setTextAlignment:NSTextAlignmentCenter];
        [artistNameLabel setText: @"My Label" ];
        [artistNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:artistNameLabel];
        
        
        
        
       
            }
    return self;
}
-(void) layoutSubviews
{
    [super layoutSubviews];
    
    
    
    
    
   
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [trackNameLabel release];
    [collectionNameLabel release];
    [priceLabel release];
    [artistNameLabel release];
    [super dealloc];
}
@end
