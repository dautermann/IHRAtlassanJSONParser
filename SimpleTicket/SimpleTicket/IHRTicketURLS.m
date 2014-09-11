//
//  IHRTicketURLS.m
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/10/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRTicketURLS.h"

@implementation IHRTicketURLS

- (BOOL)recursivelyHuntForTicketURLs:(id)object
{
    BOOL found = NO;

    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)object;
        for (NSString *key in[dict allKeys])
        {
            // "Ticket URLs" is case sensitive here; I'm more a fan of being able to handle mixed case
            if ([key isEqualToString:@"Ticket URLs"])
            {
                id potentialArray = [dict objectForKey:key];
                if ([potentialArray isKindOfClass:[NSArray class]])
                {
                    self.ticketURLs = (NSArray *)potentialArray;
                    return YES;
                }
            }
            else
            {
                id child = [dict objectForKey:key];
                found = [self recursivelyHuntForTicketURLs:child];
            }
        }
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        for (id child in object)
        {
            found = [self recursivelyHuntForTicketURLs:child];
        }
    }

    return(found);
}

- (void)loadTicketURLs
{
    NSURL *fileURL = [[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:@"ticketurljson"];
    NSError *error;

    NSData *dataFromFile = [NSData dataWithContentsOfFile:[fileURL path] options:NSDataReadingUncached error:&error];
    if (dataFromFile)
    {
        NSDictionary *jsonDictFromFile = [NSJSONSerialization JSONObjectWithData:dataFromFile options:0 error:&error];
        if (jsonDictFromFile)
        {
            [self recursivelyHuntForTicketURLs:jsonDictFromFile];
        }
    }
    else
    {
        NSLog(@"error while trying to open %@ - %@", [fileURL absoluteString], [error localizedDescription]);
    }
}

@end
