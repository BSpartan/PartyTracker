//
//  MapPin.swift
//  Park View
//
//  Created by Fhict on 09/04/15.
//  Copyright (c) 2015 Chris Wagner. All rights reserved.
//

import Foundation
import MapKit

class MapPin: MKAnnotationView {
    class var reuseIdentifier:String {
        return "mapPin"
    }
    
    var partyLocation:PartyLocation?
    private var calloutView:MapPinCallout?
    private var hitOutside:Bool = true
    
    var preventDeselection:Bool {
        return !hitOutside
    }
    
    
    convenience init(annotation:MKAnnotation!) {
        self.init(annotation: annotation, reuseIdentifier: MapPin.reuseIdentifier)
        let attractionAnnotation = self.annotation as AttractionAnnotation
        image = UIImage(named: "pin_small")
        canShowCallout = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        let calloutViewAdded = calloutView?.superview != nil
        
        if (selected || !selected && hitOutside) {
            super.setSelected(selected, animated: animated)
        }
        
        self.superview?.bringSubviewToFront(self)
        
        if (calloutView == nil) {
            calloutView = MapPinCallout()
        }
        
        if (self.selected && !calloutViewAdded) {
            addSubview(calloutView!)
        }
        
        if (!self.selected) {
            calloutView?.removeFromSuperview()
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        var hitView = super.hitTest(point, withEvent: event)
        
        if let callout = calloutView {
            if (hitView == nil && self.selected) {
                hitView = callout.hitTest(point, withEvent: event)
            }
        }
        
        hitOutside = hitView == nil
        
        return hitView;
    }
}