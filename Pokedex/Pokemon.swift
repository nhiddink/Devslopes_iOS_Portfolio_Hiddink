//
//  Pokemon.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/25/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _description: String!
    private var _hp: String!
    private var _speed: String!
    private var _attack: String!
    private var _defense: String!
    private var _spAttack: String!
    private var _spDefense: String!
    private var _nextEvoName: String!
    private var _nextEvoId: String!
    private var _nextEvoLvl: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var type: String {
        if _type == nil {_type = ""}
        return _type
    }
    
    var height: String {
        if _height == nil {_height = ""}
        return _height
    }
    
    var weight: String {
        if _weight == nil {_weight = ""}
        return _weight
    }
    
    var description: String {
        if _description == nil {_description = ""}
        return _description
    }
    
    var hp: String {
        if _hp == nil {_hp = ""}
        return _hp
    }
    
    var speed: String {
        if _speed == nil {_speed = ""}
        return _speed
    }
    
    var attack: String {
        if _attack == nil {_attack = ""}
        return _attack
    }
   
    var defense: String {
        if _defense == nil {_defense = ""}
        return _defense
    }
    
    var spAttack: String {
        if _spAttack == nil {_spAttack = ""}
        return _spAttack
    }
    
    var spDefense: String {
        if _spDefense == nil {_spDefense = ""}
        return _spDefense
    }
    
    var nextEvoName: String {
        if _nextEvoName == nil {_nextEvoName = ""}
        return _nextEvoName
    }
    
    var nextEvoId: String {
        if _nextEvoId == nil {_nextEvoId = ""}
        return _nextEvoId
    }
    
    var nextEvoLvl: String {
        if _nextEvoLvl == nil {_nextEvoLvl = ""}
        return _nextEvoLvl
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
        
            if let dict = result.value as? Dictionary<String, AnyObject> {
            
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    if let type = types[0]["name"]{
                        self._type = type.uppercaseString
                    }
                    if types.count > 1 {
                        for x in 1 ..< types.count {
                            if let type = types[x]["name"] {
                                self._type! += "/\(type.uppercaseString)"
                            }
                        }
                    }
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let descArray = dict["descriptions"] as? [Dictionary<String, String>] where descArray.count > 0 {
                    
                    if let url = descArray[0]["resource_uri"]{
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                        
                            let desResult = response.result
                            if let descDict = desResult.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            
                            completed()
                        }
                    }
                    
                } else {
                    self._description = ""
                }
                if let hp = dict["hp"] as? Int {
                    self._hp = "\(hp)"
                }
                if let speed = dict["speed"] as? Int {
                    self._speed = "\(speed)"
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let spAttack = dict["sp_atk"] as? Int {
                    self._spAttack = "\(spAttack)"
                }
                if let spDefense = dict["sp_def"] as? Int {
                    self._spDefense = "\(spDefense)"
                }
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    if let to = evolutions[0]["to"] as? String {
                        //mega evolutions not supported
                        if to.rangeOfString("mega") == nil {
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString:"")
                                
                                self._nextEvoId = num
                                self._nextEvoName = to
                                
                                if let lvl = evolutions[0]["level"] as? String {
                                    self._nextEvoLvl = "LVL. \(lvl)"
                                }
                            }
                        }
                    }
                }
                
            }
        }
    
    }

}