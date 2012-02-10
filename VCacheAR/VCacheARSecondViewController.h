//
//  VCacheARSecondViewController.h
//  VCacheAR
//
//  Created by Grif on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import "SM3DAR.h" 
#import "AudioToolbox/AudioServices.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface VCacheARSecondViewController : UIViewController <MKMapViewDelegate, SM3DARDelegate, CLLocationManagerDelegate> 
{
	SystemSoundID focusSound;
    BOOL sm3darInitialized;
    CLLocationManager *locationManager;
    IBOutlet SM3DARMapView *mapView;
    
    
    CLLocationAccuracy desiredLocationAccuracy;
    NSInteger desiredLocationAccuracyAttempts;
    BOOL acceptableLocationAccuracyAchieved;
}

@property (nonatomic, retain) IBOutlet SM3DARMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locationManager;
- (IBAction) refreshButtonTapped;


//@property (retain, nonatomic) IBOutlet UILabel *playerNameLabel;

@end
