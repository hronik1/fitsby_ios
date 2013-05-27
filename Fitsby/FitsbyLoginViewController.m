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
#import "UserResponse.h"
#import "User.h"
#import "UserApplication.h"

static NSString *const SEGUE_ID = @"LoggedIn";

@interface FitsbyLoginViewController ()

/**
 *
 * initializeProgress
 *
 * Helper method to contain all of the initialization information of the spinner.
 *
 * @return  A fully initialized progress spinner
 */
- (UIActivityIndicatorView *)initializeProgress;

/**
 *
 * showFailureDialog
 *
 * Pops up an UIAlertView alerting user that their registratin failed.
 *
 * @return  Nothing
 */
- (void) showFailureDialog;

/**
 *
 * showRememberMeDialog
 *
 * Pops up an UIAlertView prompting the user if they want to store their credentials.
 *
 * @return  Nothing
 */
- (void) showRememberMeDialog;

@end

@implementation FitsbyLoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.emailAddressInput) || (textField ==
                                              self.passwordInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneClicked:(id)sender {
    NSString *email = self.emailAddressInput.text;
    NSString *password = self.passwordInput.text;
    if (!email.length || !password.length) {
        NSLog(@"fields not complete");
        //TODO alert user
    } else {
        [self.view endEditing:YES];
        UIActivityIndicatorView *progress = [self initializeProgress];
        [progress startAnimating];
        
        dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
        dispatch_async(queue, ^{
            UserResponse *userResponse = [UserCommunication loginUser:email withPassword:password];
            dispatch_async(dispatch_get_main_queue(), ^{
                [progress stopAnimating];
                if (!userResponse) {
                    //TODO tailor failure message
                    [self showFailureDialog];
                    NSLog(@"userResponse nil");
                    return;
                } else if (!userResponse.successful) {
                    NSLog(@"failure");
                    //TODO tailor failure message
                    [self showFailureDialog];
                    return;
                }
                User *user = userResponse.user;
                if (!user) {
                    //TODO tailor failure message
                    [self showFailureDialog];
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

- (void)showFailureDialog {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Doh, either your username or password is wrong"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showRememberMeDialog {
    //TODO
}
@end
