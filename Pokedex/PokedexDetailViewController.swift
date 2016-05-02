//
//  PokedexDetailViewController.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/29/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class PokedexDetailViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var specialLabel: UILabel!
    @IBOutlet weak var currentEvoLabel: UILabel!
    @IBOutlet weak var nextEvoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameLabel.text = "\(pokemon.name.uppercaseString)"
        mainImg.image = UIImage(named:"\(pokemon.pokedexId)")
        pokemon.downloadPokemonDetails { () -> () in
            //called after download is completed
            self.updateUI()
        }
        
    }

    func updateUI() {
        type1Label.text = pokemon.type1
        type2Label.text = pokemon.type2
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        descriptionLabel.text = pokemon.description
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        speedLabel.text = pokemon.speed
        specialLabel.text = pokemon.special
        currentEvoLabel.text = pokemon.currentEvo
        
        if pokemon.currentEvoId == "" {
            currentEvoLabel.text = "No Evolutions"
            currentEvoImage.hidden = true
            nextEvoImage.hidden = true
        } else {
            currentEvoImage.hidden = false
            currentEvoImage.image = UIImage(named: pokemon.currentEvoId)
            var str = "Next Evolution: \(pokemon.currentEvo)"
            
            if pokemon.currentEvoLvl != "" {
                str += " - LVL. \(pokemon.currentEvoLvl)"
            }
        }
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backPressed", sender: self)
    }

}