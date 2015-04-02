//
//  PartyLocation.swift
//  PartyRadar
//
//  Created by Fhict on 02/04/15.
//  Copyright (c) 2015 Fhict. All rights reserved.
//

import Foundation
import MapKit

class PartyLocation: NSObject {
    
    var name: NSString?
    var location: CLLocationCoordinate2D?
    var image: NSString?
    var desc: NSString?
    var website: NSString?
    
    var partys:NSMutableArray = []
}


