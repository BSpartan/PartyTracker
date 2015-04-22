//
//  ParkMapViewController.swift
//  Park View
//
//  Created by Niv Yahel on 2014-10-30.
//  Copyright (c) 2014 Chris Wagner. All rights reserved.
//

import UIKit
import MapKit

class ParkMapViewController: UIViewController, MKMapViewDelegate {
  @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var partyContainer: UIView!
    @IBOutlet weak var searchField: UITextField!
    
  var park = Park(filename: "MagicMountain")
  var selectedOptions = [MapOptionsType]()
  var pinInformationView: UIView!
    var partyViewController: PartyViewController?
    
  var pinInformationViewController: PinInformationViewController!
  
  override func viewDidLoad() {
    //self.partyContainer.frame = CGRectMake(0, 700, 500, 500);
    super.viewDidLoad()
    
    let latDelta = park.overlayTopLeftCoordinate.latitude -
      park.overlayBottomRightCoordinate.latitude
    
    // think of a span as a tv size, measure from one corner to another
    let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
    
    let region = MKCoordinateRegionMake(park.midCoordinate, span)
    
    mapView.region = region
    mapView.delegate = self;
    
    
    
    addAttractionPins()
    

    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Add methods
  
  func addAttractionPins() {
    let filePath = NSBundle.mainBundle().pathForResource("MagicMountainAttractions", ofType: "plist")
    let attractions = NSArray(contentsOfFile: filePath!)
    for attraction in attractions! {
      let point = CGPointFromString(attraction["location"] as String)
      let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
      let title = attraction["name"] as String
      let typeRawValue = (attraction["type"] as String).toInt()!
      let subtitle = attraction["subtitle"] as String
      let names = attraction["names"] as NSString
      let locationName = attraction["locationName"] as NSString
      let partyName = attraction["partyname"] as NSString
      let partyGenre = attraction["partygenre"] as NSString
      let partyArtist = attraction["partyartist"] as NSString
      let partyTime = attraction["partytime"] as NSString
      let partyAge = attraction["partyage"] as Int
      let partyLocation = PartyLocation(name: names, locationname: locationName, partyname: partyName, partygenre: partyGenre, partyartist: partyArtist, partytime: partyTime, partyage: partyAge)
      let annotation = AttractionAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, partylocation: partyLocation)
      mapView.addAnnotation(annotation)
    }
  }

   
    @IBAction func searchCancel(sender: AnyObject) {
        searchField.text = ""
        self.view.endEditing(true)
    }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    partyViewController = segue.destinationViewController as? PartyViewController
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        //let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        let annotationView = MapPin(annotation: annotation)
        return annotationView
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        if let mapPin = view as? MapPin {
            var partyLocation : PartyLocation = mapPin.partyLocation!
            self.partyContainer.frame = CGRectMake(0, 700, 500, 500);
            UIView.animateWithDuration(0.5, animations: {
                self.partyContainer.frame = CGRectMake(0, 300, 500, 500);
            })
            
            if(partyViewController != nil) {
                partyViewController?.setPartyProperties(partyLocation.name!, location: partyLocation.locationName!, partyTitle: partyLocation.partyName!, partyGenre: partyLocation.partyGenre!, partyArtist: partyLocation.partyArtist!, partyTime: partyLocation.partyTime!, partyAge: partyLocation.partyAge)
            }
        }
    }
    
    func mapView(mapView: MKMapView!, didDeselectAnnotationView view: MKAnnotationView!) {
        if let mapPin = view as? MapPin {
            UIView.animateWithDuration(0.2, animations: {
                    self.partyContainer.frame = CGRectMake(0, 700, 500, 500);
                })
        }
    }
    
}
