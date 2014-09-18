//
//  IHRTicketDetailViewController.m
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/11/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRTicketDetailViewController.h"

@interface IHRTicketDetailViewController ()

@property (weak) IBOutlet UITextView *detailTextView;

@end

@implementation IHRTicketDetailViewController

- (void)viewDidLoad
{
    if(self.ticketURL)
    {
        // set the title bar
        self.navigationItem.title = [self.ticketURL lastPathComponent];
        
        NSURLRequest *ticketDataRequest = [[NSURLRequest alloc] initWithURL:self.ticketURL];
        if(ticketDataRequest)
        {
            [NSURLConnection sendAsynchronousRequest:ticketDataRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                if([data length] > 0 && !connectionError)
                {
                    NSError *error;
                    NSDictionary *ticketDetailDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    if(ticketDetailDictionary)
                    {
                        NSMutableString *detailText = [[NSMutableString alloc] initWithCapacity:256]; // 256 is a wild guess...
                        for(NSString *aKey in [ticketDetailDictionary allKeys])
                        {
                            id aValue = [ticketDetailDictionary objectForKey:aKey];
                            [detailText appendFormat:@"%@ : %@\n", aKey, [aValue description]];
                        }
                        
                        self.detailTextView.text = detailText;
                    }
                    else
                    {
                        NSLog(@"unable to parse json data from %@ - %@", [[ticketDataRequest URL] absoluteString], [connectionError localizedDescription]);
                    }
                }
                else
                {
                    if(connectionError)
                    {
                        NSLog(@"error while trying to download from %@ - %@", [[ticketDataRequest URL] absoluteString], [connectionError localizedDescription]);
                    }
                    else
                    {
                        NSLog(@"no data downloaded for %@", [[ticketDataRequest URL] absoluteString]);
                    }
                }
            }];
        }
    }
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
