//
//  PokeCell.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/25/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 7.0
    
    }
    
    func configurePokemonCell(pokemon: Pokemon){
        self.pokemon = pokemon
        
        nameLabel.text = "\(self.pokemon.name.capitalizedString)"
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}
