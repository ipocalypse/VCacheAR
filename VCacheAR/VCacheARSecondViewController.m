//
//  VCacheARSecondViewController.m
//  VCacheAR
//
//  Created by Grif on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define IpocQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 
#define IpocURL [NSURL URLWithString: @"http://www.grif.tv/json.php"] 
#import <MapKit/MapKit.h>
#import "VCacheARSecondViewController.h"






@interface NSDictionary(JSONCategories)
+(NSDictionary*)dictionaryWithContentsOfJSONURLString:(NSString*)urlAddress;
-(NSData*)toJSON;
@end

@implementation NSDictionary(JSONCategories)


+(NSDictionary*)dictionaryWithContentsOfJSONURLString:(NSString*)urlAddress
{
    NSData* data = [NSData dataWithContentsOfURL: [NSURL URLWithString: urlAddress] ];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}



-(NSData*)toJSON
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;    
}
@end

@implementation VCacheARSecondViewController
//@synthesize playerNameLabel;
@synthesize mapView;
@synthesize locationManager;




//retrieves the player name from the first view controller.
-(NSString*)retrieveString
{
    NSString* recoveredString = [[NSUserDefaults standardUserDefaults] objectForKey:@"String"];
    return recoveredString;
}




- (void)dealloc 
{    
    [mapView release];
    mapView = nil;

    //[playerNameLabel release];
	[super dealloc];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [mapView.sm3dar startCamera];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
      
    
    self.mapView = [[[SM3DARMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]; 
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    [self.view addSubview:mapView];   
    [mapView init3DAR];
    [super viewDidLoad];
    dispatch_async(IpocQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: IpocURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
    
    [NSThread detachNewThreadSelector:@selector(UploadUserLocation:) toTarget:self withObject:nil];
    
    //initializes timer
    
    
    //timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(UploadUserLocation:) userInfo:nil repeats:YES];

}

-(void) UploadUserLocation:(id)anObject {
    
    
   // NSAutoreleasePool *autoreleasepool = [[NSAutoreleasePool alloc] init];
    
    for (int i=0; i<1000000; i++){
        // Upload UID, LAT, and LONG to server
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        
        CLLocation *location = [locationManager location];
        CLLocationCoordinate2D coordinate = [location coordinate];
        
        
        NSString *Latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
        NSString *Longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
        //NSString *Name = [NSString stringWithFormat:@"DORK"];
        NSString *Name = [self retrieveString];
       // NSLog(@"%@",Name);
   // NSLog(@"Testing timer");
        NSString *Uid = [[UIDevice currentDevice] uniqueIdentifier];
        NSString *post = [NSString stringWithFormat:@"http://www.grif.tv/add2.php?Uid=%@&Name=%@&Latitude=%@&Longitude=%@", Uid, Name, Latitude, Longitude];
        [NSData dataWithContentsOfURL:[NSURL URLWithString:post]];
        [NSThread sleepForTimeInterval:5.0];
    }
    [NSThread exit];
    
    //we need to do this to prevent memory leaks
    
   // [autoreleasepool release];
    
}

- (void)fetchedData:(NSData *)responseData {
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData 
                                                         options:kNilOptions 
                                                           error:&error];
    NSArray* locations = [json objectForKey:@"location"]; 
    
    NSLog(@"location: %@", locations); 
    
    CLLocationCoordinate2D corde;
    //Place User locations on Map and in 3DAR with UID
    
    for (int i=0; i<[locations count]; i++){
        corde.latitude = [[[locations objectAtIndex:i] valueForKey:@"Latitude"]floatValue];
        corde.longitude = [[[locations objectAtIndex:i] valueForKey:@"Longitude"]floatValue];
        NSString *Name = [[locations valueForKey:@"Name"]objectAtIndex:i];
        
        // with 2D pointers
        
        CLLocation *Location = [[CLLocation alloc] initWithLatitude:corde.latitude longitude:corde.longitude];
        
        SM3DARPointOfInterest *poi = [[SM3DARPointOfInterest alloc] initWithLocation:Location 
                                                                               title:Name
                                                                            subtitle:nil
                                                                                 url:nil
                                                                          properties:nil];
        
        
        // With 3D pointers
        
        //SM3DARTexturedGeometryView *modelView = [[SM3DARTexturedGeometryView alloc] initWithOBJ:@"star.obj" textureNamed:nil];
        // SM3DARTexturedGeometryView *model2View = [[SM3DARTexturedGeometryView alloc] initWithOBJ:@"star.obj" textureNamed:nil];
        
        // SM3DARPointOfInterest *poi = (SM3DARPointOfInterest *)[mapView.sm3dar addPointAtLatitude:corde.latitude
        //                                                                                longitude:corde.longitude
        //                                                                                 altitude:0
        //                                                                                    title:Name
        //                                                                                   view:modelView];
        //
        //
        //SM3DARPointOfInterest *poi2 = (SM3DARPointOfInterest *)[mapView.sm3dar addPointAtLatitude:corde.latitude + 0.0002
        //                                                                              longitude:corde.longitude + 0.0002
        //                                                                             altitude:0
        //                                                                              title:nil
        //                                                                             view:model2View];
        //[mapView addAnnotation:poi2];
        [mapView addAnnotation:poi];
    }
    
    UIImageView *star = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh_button.png"]] autorelease];
    
    CLLocationDegrees latitude = mapView.sm3dar.userLocation.coordinate.latitude + 0.1;
    CLLocationDegrees longitude = mapView.sm3dar.userLocation.coordinate.longitude;
    
    
    // NOTE: poi is autoreleased
    
    northStar = (SM3DARPointOfInterest*)[[mapView.sm3dar addPointAtLatitude:latitude
                                                                  longitude:longitude
                                                                   altitude:3000.0 
                                                                      title:@"Polaris" 
                                                                       view:star] retain];
    
    northStar.canReceiveFocus = NO;
    
    // 3DAR bug: addPointAtLatitude:longitude:altitude:title:view should add the point, not just init it.  Doh!
    [mapView.sm3dar addPoint:northStar];
    
}

- (void)viewDidUnload
{
  //  [self setPlayerNameLabel:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction) refreshButtonTapped
{
    [self.mapView removeAllAnnotations];
    dispatch_async(IpocQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: IpocURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

@end
