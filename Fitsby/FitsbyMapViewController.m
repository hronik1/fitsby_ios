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
#import <GoogleMaps/GoogleMaps.h>

#define METERS_PER_MILE 1609.344

@interface FitsbyMapViewController () {
    UILongPressGestureRecognizer *longPressGesture;
    QLContextCoreConnector *contextCoreConnector;
    CLLocationCoordinate2D selectedCoords;
}

- (void)showAddPlaceDialog:(CLLocationCoordinate2D) locCoord;
@end

@implementation FitsbyMapViewController
{
  
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
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:12];
    
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.settings.compassButton = YES;
    mapView.settings.myLocationButton = YES;
    
       self.view = mapView;
    
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView.myLocationEnabled = YES;
    });
    
    NSString *stringRequest = @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AIzaSyCa0vigwlhrkI6Eob18-3EsmVvIeHmJExs";
    
    NSURL *url = [NSURL URLWithString:stringRequest];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    //create json data
    //NSData *jsonParams = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    //NSString *jsonString = [[NSString alloc]initWithData:jsonParams encoding:NSUTF8StringEncoding];
    //NSLog(@"My json is %@", jsonString);
    
    //set body
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request setValue:[NSString stringWithFormat:@"%d", [jsonParams length]] forHTTPHeaderField:@"Content-Length"];
    //[request setHTTPBody: jsonParams];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *responseString = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Response is %@", responseString);
    /*
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
    }];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (!firstLocationUpdate) {
        // If the first location update has not yet been recieved, then jump to that
        // location.
        firstLocationUpdate = YES;
        
    }
}
/*
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
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.placeholder = @"Place Name";
    [alert show];
}

# pragma mark - UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index %i", buttonIndex);
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        
        QLPlace *place = [[QLPlace alloc] init];
        place.name = textField.text;
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

# pragma mark - QLContextPlaceConnectorDelegate methods

- (void)didGetPlaceEvent:(QLPlaceEvent *)placeEvent
{
    NSLog(@"did get place event %@, %d", [placeEvent place].name, placeEvent.eventType);
    
    NSString *placeTitle = nil;
    switch (placeEvent.eventType)
    {
        case QLPlaceEventTypeAt:
            placeTitle = [NSString stringWithFormat:@"At %@", placeEvent.place.name];
            //see how checkin wants to happen
            break;
        case QLPlaceEventTypeLeft:
            placeTitle = [NSString stringWithFormat:@"Left %@", placeEvent.place.name];
            //see how checkout wants to happen
            break;
    }
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertAction = NSLocalizedString(@"Foo", nil);
    localNotification.alertBody = [NSString stringWithFormat:@"%@", placeTitle];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}
*/

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"lat%f - lon%f", location.coordinate.latitude, location.coordinate.longitude);
    //CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
    mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                    zoom:14];
}

@end
