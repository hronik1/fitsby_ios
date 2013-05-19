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
