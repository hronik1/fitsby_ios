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

@interface FitsbyMapViewController : UIViewController <UIAlertViewDelegate, QLContextPlaceConnectorDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) QLContextPlaceConnector *placeConnector;

@end
