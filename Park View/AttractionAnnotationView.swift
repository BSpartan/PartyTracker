//
//  AttractionAnnotationView.swift
//  Park View
//
//  Created by Niv Yahel on 2014-10-30.
//  Copyright (c) 2014 Chris Wagner. All rights reserved.
//

import UIKit
import MapKit

class AttractionAnnotationView: MKAnnotationView {
  
  // Required for MKAnnotationView
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // Called when drawing the AttractionAnnotationView
    override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override init(annotation: MKAnnotation, reuseIdentifier: String) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    let attractionAnnotation = self.annotation as AttractionAnnotation
    image = UIImage(named: "pin")
    start();
    
  }
    
    override func setSelected(selected: Bool, animated: Bool) {
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        var calloutMenu: UIView?
        return calloutMenu
    }
    
    deinit {
        stop()
    }
    
    func start() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"handler:", name: "My Notification", object: self);
        
    }
    
    func stop() {
        //NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    func handler(notification: NSNotification) {
       println("MyNotification was handled")
        //closure(notification);
    }
    
    
    
}