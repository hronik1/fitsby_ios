//
//  FitsbyMapViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 6/25/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyMapViewController.h"
#import "ContextCore.embeddedframework/ContextCore.framework/Headers/QLContextCoreConnector.h"
#import "ContextLocation.embeddedframework/ContextLocation.framework/Headers/QLPlaceEvent.h"
#import "ContextLocation.embeddedframework/ContextLocation.framework/Headers/QLPlace.h"
#import "ContextLocation.embeddedframework/ContextLocation.framework/Headers/QLGeoFenceCircle.h"

#define METERS_PER_MILE 1609.344

@interface FitsbyMapViewController () {
    UILongPressGestureRecognizer *longPressGesture;
    QLContextCoreConnector *contextCoreConnector;
    CLLocationCoordinate2D selectedCoords;
}

- (void)showAddPlaceDialog:(CLLocationCoordinate2D) locCoord;
@end

@implementation FitsbyMapViewController

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
    
    longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapView addGestureRecognizer:longPressGesture];
    
    contextCoreConnector = [[QLContextCoreConnector alloc] init];
    [contextCoreConnector checkStatusAndOnEnabled:^(QLContextConnectorPermissions *contextConnectorPermissions) {
        NSLog(@"enabled");
        self.placeConnector = [[QLContextPlaceConnector alloc] init];
        self.placeConnector.delegate = self;
    } disabled:^(NSError *error) {
        [contextCoreConnector enableFromViewController:self success:^{
            NSLog(@"enabling success");
            self.placeConnector = [[QLContextPlaceConnector alloc] init];
            self.placeConnector.delegate = self;
            
        } failure:^(NSError *error) {
            NSLog(@"enabling fail");
        }];
        NSLog(@"disabled");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.14139881;
    zoomLocation.longitude= -105.2863554;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
}

-(void)handleLongPressGesture:(UIGestureRecognizer*)sender {
    // remove it so multiple events aren't fired, will be added again after processing
    [self.mapView removeGestureRecognizer:sender];
    
    // Here we get the CGPoint for the touch and convert it to latitude and longitude coordinates to display on the map
    CGPoint point = [sender locationInView:self.mapView];
    CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    NSLog(@"lat:%f long:%f", locCoord.latitude, locCoord.longitude);
    selectedCoords = locCoord;
    [self showAddPlaceDialog:locCoord];
    //        // Then all you have to do is create the annotation and add it to the map
    //        YourAnnotation *dropPin = [[YourAnnotation alloc] init];
    //        dropPin.latitude = [NSNumber numberWithDouble:locCoord.latitude];
    //        dropPin.longitude = [NSNumber numberWithDouble:locCoord.longitude];
    //        [self.mapView addAnnotation:dropPin];
    //        [dropPin release];
}

- (void)showAddPlaceDialog:(CLLocationCoordinate2D) locCoord
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Would you like to add this location?"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index %i", buttonIndex);
    if (buttonIndex == 1) {
        QLPlace *place = [[QLPlace alloc] init];
        place.name = @"Home";
        QLGeoFenceCircle *circle = [[QLGeoFenceCircle alloc] init];
        circle.latitude = selectedCoords.latitude;
        circle.longitude = selectedCoords.longitude;
        circle.radius = 100;
        place.geoFence = circle;
        
        [self.placeConnector createPlace:place success:^(QLPlace *place) {
            NSLog(@"success add");
        } failure:^(NSError *error) {
            NSLog(@"fail add");
        }];
    }
    [self.mapView addGestureRecognizer:longPressGesture];
}

- (void)didGetPlaceEvent:(QLPlaceEvent *)placeEvent
{
    NSLog(@"did get place event %@", [placeEvent place].name);
}

@end
