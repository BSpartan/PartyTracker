//
//  MainViewController.swift
//  PartyRadar
//
//  Created by Fhict on 26/03/15.
//  Copyright (c) 2015 Fhict. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    var manager = CLLocationManager()
    
    @IBOutlet weak var theMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.requestWhenInUseAuthorization()
        updateMap()
    }
    
    //MARK: location manager
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        var locValue:CLLocationCoordinate2D = manager.location.coordinate
        
        println("locations = \(locValue.latitude) \(locValue.longitude)")
        
        let latitude:CLLocationDegrees = locValue.latitude
        let longitude: CLLocationDegrees = locValue.longitude
        
        //change for Zoom Level
        let latDelta: CLLocationDegrees = 0.5
        let longDelta: CLLocationDegrees = 0.5
        
        //update the map
        var theSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        self.theMap.setRegion(theRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Eindhoven"
        annotation.subtitle = "Chillen"
        
        self.theMap.addAnnotation(annotation);
        
        //stop updating location for manual update
        self.manager.stopUpdatingLocation()
        
    }
    
    func updateMap() {
        
        if (CLLocationManager.locationServicesEnabled())
        {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
    }
    
    func mapView(mapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                return nil
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.image = UIImage(named: "pin")
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = .Purple
                
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
    }

}
