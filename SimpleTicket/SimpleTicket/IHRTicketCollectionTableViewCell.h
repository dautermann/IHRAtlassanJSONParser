//
//  IHRTicketCollectionTableViewCell.h
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/11/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRJiraTicketCollectionViewController.h"

@interface IHRTicketCollectionTableViewCell : UITableViewCell

@property (strong) NSURL *ticketURL;

// weak as we don't want to have a retain cycle
@property (weak) IHRJiraTicketCollectionViewController *parentVC;

@end
