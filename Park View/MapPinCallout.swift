//
//  MapPinCallout.swift
//  Park View
//
//  Created by Fhict on 09/04/15.
//  Copyright (c) 2015 Chris Wagner. All rights reserved.
//

import Foundation
import UIKit

class MapPinCallout: UIView {
    override func hitTest(var point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convertPoint(point, toView: self) ?? point
        
        let isInsideView = pointInside(viewPoint, withEvent: event)
        
        var view = super.hitTest(viewPoint, withEvent: event)
        
        return view
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(bounds, point)
    }
}