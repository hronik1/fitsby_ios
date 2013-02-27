//
//  main.m
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FitsbyAppDelegate.h"
#import "UserApplication.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, NSStringFromClass([UserApplication class]), NSStringFromClass([FitsbyAppDelegate class]));
    }
}
