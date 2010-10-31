//
//  ThunderViewController.m
//  Thunder
//
//  Created by James Darling on 30/10/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "ThunderViewController.h"


@implementation ThunderViewController





// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	mapView=[[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.showsUserLocation=TRUE;
	mapView.mapType=MKMapTypeStandard;
	mapView.delegate=self;
	
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.01;
	span.longitudeDelta=0.01;
	
	CLLocationCoordinate2D location=mapView.userLocation.coordinate;
	
	location.latitude=51.523367;
	location.longitude=-0.078602;
	region.span=span;
	region.center=location;
	
	/*Geocoder Stuff*/
	
	geoCoder=[[MKReverseGeocoder alloc] initWithCoordinate:location];
	geoCoder.delegate=self;
	[geoCoder start];
	
	
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
	[self.view insertSubview:mapView atIndex:0];
	//[self.view insertSubview:ThunderViewController.view atIndex:0];
}

- (IBAction)changeType:(id)sender{
	if(mapType.selectedSegmentIndex==0){
		mapView.mapType=MKMapTypeStandard;
	}
	else if (mapType.selectedSegmentIndex==1){
		mapView.mapType=MKMapTypeSatellite;
	}
	else if (mapType.selectedSegmentIndex==2){
		mapView.mapType=MKMapTypeHybrid;
	}
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	NSLog(@"Reverse Geocoder Errored");
	
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	NSLog(@"Reverse Geocoder completed");
	mPlacemark=placemark;
	[mapView addAnnotation:placemark];
}

/*
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	annView.animatesDrop=TRUE;
	return annView;
}
*/

- (IBAction)dropPin:(id)sender{
	CLLocationCoordinate2D location2=mapView.userLocation.coordinate;
	location2.latitude=51.523567;
	location2.longitude=-0.078602;
	geoCoder=[[MKReverseGeocoder alloc] initWithCoordinate:location2];
	geoCoder.delegate=self;
	[geoCoder start];
}


@end