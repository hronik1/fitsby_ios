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

//helper to initialize a indeterminate spinner
- (UIActivityIndicatorView *)initializeProgress;
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
