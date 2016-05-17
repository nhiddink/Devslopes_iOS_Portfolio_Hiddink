//
//  Annotations.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/16/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import Foundation
import MapKit

class UserAnnotations: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
    
        self.coordinate = coordinate
    }
}