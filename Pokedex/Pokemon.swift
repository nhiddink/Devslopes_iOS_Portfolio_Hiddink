//
//  Pokemon.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/25/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
            return _pokedexId
    }
    
    init(_: String, pokedexId: Int){
    
        self._name = name
        self._pokedexId = pokedexId
    
    
    }
    
    init(){
    
        
        
    }

}