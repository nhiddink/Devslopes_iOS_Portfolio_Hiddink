//
//  DataService.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/17/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()

    private var _REF_BASE = Firebase(url: "https://socialnetnh.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}