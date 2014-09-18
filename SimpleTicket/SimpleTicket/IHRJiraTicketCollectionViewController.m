//
//  IHRJiraTicketCollectionViewController.m
//  SimpleTicket
//
//  Created by Michael Dautermann on 9/11/14.
//  Copyright (c) 2014 Clear Channel. All rights reserved.
//

#import "IHRJiraTicketCollectionViewController.h"
#import "IHRTicketCollectionTableViewCell.h"
#import "IHRTicketDetailViewController.h"

@interface IHRJiraTicketCollectionViewController ()

@end

@implementation IHRJiraTicketCollectionViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    IHRTicketDetailViewController *detailVC = (IHRTicketDetailViewController *)segue.destinationViewController;
    if(detailVC)
    {
        IHRTicketCollectionTableViewCell *ticketCell = (IHRTicketCollectionTableViewCell *)sender;
        
        detailVC.ticketURL = ticketCell.ticketURL;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Jira Tickets";

    _ticketURLParseObject = [[IHRTicketURLS alloc] init];
    
    [_ticketURLParseObject loadTicketURLs];
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

#pragma mark table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // if _ticketURLParseObject or ticketURLs is nil, count is sent to a nil object
    // and we'll return a zero...
    return([_ticketURLParseObject.ticketURLs count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IHRTicketCollectionTableViewCell *infoCell = (IHRTicketCollectionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if(!infoCell)
    {
        infoCell = [[IHRTicketCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
    }
    
    if(infoCell)
    {
        NSString *fullURLString = [_ticketURLParseObject.ticketURLs objectAtIndex:indexPath.row];
        infoCell.textLabel.text = [fullURLString lastPathComponent]; // hope there are no parameters or gobbldeygook after the ticket number
        infoCell.ticketURL = [NSURL URLWithString:fullURLString];
        infoCell.parentVC = self;
    }
    
    return(infoCell);
}

@end
