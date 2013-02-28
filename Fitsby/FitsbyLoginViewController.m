//
//  FitsbyLoginViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/21/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyLoginViewController.h"
#import "MyHttpClient.h"
#import "UserCommunication.h"

@interface FitsbyLoginViewController ()

@end

@implementation FitsbyLoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.emailAddressInput) || (textField ==
                                              self.passwordInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate



- (IBAction)doneClicked:(id)sender {
    NSString *email = self.emailAddressInput.text;
    NSString *password = self.passwordInput.text;
    if (!email.length || !password.length) {
        NSLog(@"fields not complete");
        //TODO alert user
    } else {
        UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.view addSubview:progress];
        progress.color = [UIColor redColor];
        progress.center = self.view.center;
        progress.hidesWhenStopped = YES;
        dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
        [progress startAnimating];
        if (progress.isAnimating)
            NSLog(@"animating");
        else
            NSLog(@"not animating");
        //NSLog(@"Isanimating:%c", progress.isAnimating);
        dispatch_async(queue, ^{
  
            //NSLog(@"Isanimating:%c", progress.isAnimating);
            [UserCommunication loginUser:email withPassword:password];
            NSLog(@"stopped");
            dispatch_async(dispatch_get_main_queue(), ^{
                [progress stopAnimating];
            });
        });
        //[UserCommunication loginUser:email withPassword:password];
    }
}

@end
