//
//  IHRJiraTicketCollectionViewController.h
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/11/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRTicketURLs.h"

@interface IHRJiraTicketCollectionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IHRTicketURLS *_ticketURLParseObject;
}

@end
