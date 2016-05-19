//
//  Profile.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/18/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import Foundation

class Profile {

    private var _username: String!

    var username: String {
        return _username
    }
    
    init(username: String){
        self._username = username
        
    }
}

