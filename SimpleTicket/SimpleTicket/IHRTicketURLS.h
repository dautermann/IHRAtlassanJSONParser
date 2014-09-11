//
//  IHRTicketURLS.h
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/10/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IHRTicketURLS : NSObject

-(void)loadTicketURLs;

@property (strong) NSArray *ticketURLs;

@end
