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
    var locationName : NSString?
    var location: CLLocationCoordinate2D?
    var image: NSString?
    var desc: NSString?
    var website: NSString?
    
    var partyName: NSString?
    var partyGenre: NSString?
    var partyArtist: NSString?
    var partyTime: NSString?
    var partyAge: Int = 0
    
    init(name : NSString, locationname : NSString, partyname : NSString, partygenre : NSString, partyartist : NSString, partytime : NSString, partyage : Int) {
        self.name = name
        self.locationName = locationname
        self.partyName = partyname
        self.partyGenre = partygenre
        self.partyArtist = partyartist
        self.partyTime = partytime
        self.partyAge = partyage
    }
    
}


