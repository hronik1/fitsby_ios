//
//  FitsbyRegistrationOnboardViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/17/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyRegistrationOnboardViewController.h"
#import "FitsbyChildViewController.h"

static NSString *const SEGUE_ID = @"registrationOnboardComplete";

@interface FitsbyRegistrationOnboardViewController () {

}

/**
 *
 * indexOfCurrentViewController
 *
 * Returns the index of the currently displayed view
 *
 * @return The index of the currently displayed view, or -1 on fail.
 */
- (NSUInteger) indexOfCurrentViewController;

@end

@implementation FitsbyRegistrationOnboardViewController

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
    self.pageViewController = [[UIPageViewController alloc]
                               initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                               navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                               options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    self.modelArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"registration_onboard1.png"],
                       [UIImage imageNamed:@"registration_onboard2.png"], [UIImage imageNamed:@"registration_onboard3.png"],
                       [UIImage imageNamed:@"registration_onboard4.png"], [UIImage imageNamed:@"registration_onboard5.png"],
                       nil];
    
    FitsbyChildViewController *contentViewController = [[FitsbyChildViewController alloc] initWithNibName:@"FitsbyChildViewController" bundle:nil];
    contentViewController.image = [self.modelArray objectAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:contentViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** Data source methods **/
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(FitsbyChildViewController *)viewController image]];
    if(currentIndex == 0)
    {
        return nil;
    }
    FitsbyChildViewController *contentViewController = [[FitsbyChildViewController alloc] init];
    contentViewController.image = [self.modelArray objectAtIndex:currentIndex - 1];
    return contentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(FitsbyChildViewController *)viewController image]];
    if(currentIndex == self.modelArray.count-1)
    {
        return nil;
    }
    FitsbyChildViewController *contentViewController = [[FitsbyChildViewController alloc] init];
    contentViewController.image = [self.modelArray objectAtIndex:currentIndex + 1];
    return contentViewController;
}

/** Delegate methods **/

- (IBAction)doneButtonClicked:(id)sender {
    int currentIndex = [self indexOfCurrentViewController];
    NSLog(@"index=%d", currentIndex);
    if (currentIndex == self.modelArray.count-1) {
        [self performSegueWithIdentifier:SEGUE_ID sender:sender];
    } else {
        //TODO alert user that that need to finish
    }
    
}

- (IBAction)cancelRegister:(UIStoryboardSegue *)segue
{
    //TODO possible implement
    //    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
    //        [self dismissViewControllerAnimated:YES completion:NULL];
    //    }
}

/** private methods **/
- (NSUInteger) indexOfCurrentViewController
{
    return [self.modelArray indexOfObject:[[self.pageViewController viewControllers][0] image]];
}
@end
