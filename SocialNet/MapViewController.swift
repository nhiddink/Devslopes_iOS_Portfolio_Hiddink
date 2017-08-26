//
//  MapViewController.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/15/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    let addresses = [
        "1 Hacker Way, Menlo Park, CA 94025",
        "1355 Market Street Suite 900, San Fransisco, CA 94103",
        "64 Market St, Venice CA 90291"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        for add in addresses {
            getPlacemarkFromAddress(add)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        getUserLocation()
    }
    
    func getUserLocation() {
    
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    
    }
    
    func centerToUserLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 10, regionRadius * 10)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        /*
        if let loc = userLocation.location {
            centerToUserLocation(loc)
        }
        */
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    
        if annotation.isKindOfClass(UserAnnotations) {
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.pinTintColor = UIColor.blueColor()
            annoView.animatesDrop = true
            return annoView
        } else if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        return nil
    }
    
    func createAnnotationForLocation(location: CLLocation) {
    
        let site = UserAnnotations(coordinate: location.coordinate)
        mapView.addAnnotation(site)
    }
    
    func getPlacemarkFromAddress(address: String) {
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let marks = placemarks where marks.count > 0 {
                if let loc = marks[0].location {
                    //Valid location with coordinates
                    self.createAnnotationForLocation(loc)
                }
            }
        }
    }
    
}
