//
//  FitsbyMapViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 6/25/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ContextLocation.embeddedframework/ContextLocation.framework/Headers/QLContextPlaceConnector.h"
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface FitsbyMapViewController : UIViewController <UIAlertViewDelegate, QLContextPlaceConnectorDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    GMSMapView *mapView;
    BOOL firstLocationUpdate;
}



@property (nonatomic) QLContextPlaceConnector *placeConnector;

@end
