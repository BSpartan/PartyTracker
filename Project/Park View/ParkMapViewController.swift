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
    
    
  var park = Park(filename: "MagicMountain")
  var selectedOptions = [MapOptionsType]()
    var pinInformationView: UIView!
    
  var pinInformationViewController: PinInformationViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let latDelta = park.overlayTopLeftCoordinate.latitude -
      park.overlayBottomRightCoordinate.latitude
    
    // think of a span as a tv size, measure from one corner to another
    let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
    
    let region = MKCoordinateRegionMake(park.midCoordinate, span)
    
    mapView.region = region
    mapView.delegate = self;
    
     self.partyContainer.frame = CGRectMake(0, 700, 500, 500);
    
    // pin information subview
    /*let storyboard = UIStoryboard(name: "MainStoryboard_Iphone", bundle: nil)
    let vc = storyboard.instantiateViewControllerWithIdentifier("PinInformationViewController") as UIViewController
    view.addSubview(vc.view)*/
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
      let type = AttractionType(rawValue: typeRawValue)!
      let subtitle = attraction["subtitle"] as String
      let annotation = AttractionAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
      mapView.addAnnotation(annotation)
    }
  }

    func createPinInformation() {
        pinInformationView.backgroundColor = UIColor.whiteColor()
        var title = UILabel(frame: CGRectMake(0, 0, 200, 21))
        title.center = CGPointMake(160, 284)
        title.textAlignment = NSTextAlignment.Center
        title.text = "EFFENAAR"
        self.pinInformationView.addSubview(title)
    }
  
  // MARK: Helper methods
  
  func loadSelectedOptions() {
    mapView.removeAnnotations(mapView.annotations)
    mapView.removeOverlays(mapView.overlays)
    
    for option in selectedOptions {
      switch (option) {
        case .MapPins:
          addAttractionPins()
      default:
        return
      }
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //let optionsViewController = segue.destinationViewController as MapOptionsViewController
    //optionsViewController.selectedOptions = selectedOptions
  }
  
  @IBAction func closeOptions(exitSegue: UIStoryboardSegue) {
    let optionsViewController = exitSegue.sourceViewController as MapOptionsViewController
    selectedOptions = optionsViewController.selectedOptions
    loadSelectedOptions()
  }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        //let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        let annotationView = MapPin(annotation: annotation)
        return annotationView
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        if let mapPin = view as? MapPin {
            //self.partyContainer.setPartyProperties()
            self.partyContainer.frame = CGRectMake(0, 700, 500, 500);
            UIView.animateWithDuration(0.5, animations: {
                self.partyContainer.frame = CGRectMake(0, 300, 500, 500);
            })
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
