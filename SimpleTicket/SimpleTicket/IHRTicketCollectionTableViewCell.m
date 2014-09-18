//
//  IHRTicketCollectionTableViewCell.m
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/11/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRTicketCollectionTableViewCell.h"
#import "IHRTicketDetailViewController.h"

@implementation IHRTicketCollectionTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(self.selected != selected)
    {
        [super setSelected:selected animated:animated];

        if(selected)
        {
            // segue to the detail view, sending along myself to get the detail
            [self.parentVC performSegueWithIdentifier:@"seeTicketDetail" sender:self];
            
            // de-select the cell in case we return to this screen
            [super setSelected:false animated:NO];
        }
    }
}

@end
