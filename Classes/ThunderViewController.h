//
//  ThunderViewController.h
//  Thunder
//
//  Created by James Darling on 30/10/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>

@interface ThunderViewController : UIViewController <MKReverseGeocoderDelegate,MKMapViewDelegate> {
	MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	IBOutlet UISegmentedControl *mapType;
}

- (IBAction)changeType:(id) sender;

@end
