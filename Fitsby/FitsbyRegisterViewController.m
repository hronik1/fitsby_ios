//
//  FitsbyRegisterViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyRegisterViewController.h"
#import "UserCommunication.h"
#import "UserResponse.h"
#import "UserApplication.h"

static NSString *const SEGUE_ID = @"register";
@interface FitsbyRegisterViewController ()

//initializes a progress indicator
- (UIActivityIndicatorView *)initializeProgress;
@end

@implementation FitsbyRegisterViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}

- (IBAction)doneClicked:(id)sender {
    NSString *email = self.emailAddressInput.text;
    NSString *password = self.passwordInput.text;
    NSString *confirmPassword = self.confirmPasswordInput.text;
    NSString *firstName = self.firstNameInput.text;
    NSString *lastName = self.lastNameInput.text;
    
    if (!email.length || !password.length || !confirmPassword.length || !firstName.length || !lastName.length) {
        NSLog(@"fields not complete");
        //TODO alert user
    } else if (password.length < 6) {
        NSLog(@"password is too short");
        //TODO alert user
    } else if (![password isEqualToString:confirmPassword]) {
        NSLog((@"password does not match confirm password"));
        //TODO alert user
    } else {
        UIActivityIndicatorView *progress = [self initializeProgress];
        [progress startAnimating];
        
        dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
        dispatch_async(queue, ^{
            UserResponse *userResponse = [UserCommunication registerUser:email withPassword:password confirmPassword:confirmPassword firstName:firstName lastName:lastName];
            dispatch_async(dispatch_get_main_queue(), ^{
                [progress stopAnimating];
                if (!userResponse) {
                    //TODO alertUser of failure
                    NSLog(@"userResponse nil");
                    return;
                } else if (!userResponse.successful) {
                    //TODO alert user of failure
                    NSLog(@"failure");
                    return;
                }
                User *user = userResponse.user;
                if (!user) {
                    //TODO alert user of failure
                    NSLog(@"user nil");
                } else {
                    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
                    userApplication.user = user;
                    (NSLog(@"segue initiated"));
                    [self performSegueWithIdentifier:SEGUE_ID sender:sender];
                }
            });
        });
    }
}

/** private methods **/
- (UIActivityIndicatorView *)initializeProgress {
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:progress];
    progress.color = [UIColor redColor];
    progress.center = self.view.center;
    progress.hidesWhenStopped = YES;
    return progress;
}
@end
