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
    @IBOutlet weak var firstEvoLabel: UILabel!
    @IBOutlet weak var secondEvoLabel: UILabel!
    @IBOutlet weak var firstEvoImage: UIImageView!
    @IBOutlet weak var secondEvoImage: UIImageView!
    
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
        firstEvoLabel.text = pokemon.firstEvo
        
        if pokemon.firstEvoId == "" {
            firstEvoLabel.text = "No Evolutions"
            firstEvoImage.hidden = true
            secondEvoImage.hidden = true
        } else {
            firstEvoImage.hidden = false
            firstEvoImage.image = UIImage(named: pokemon.firstEvoId)
            var str = "Next Evolution: \(pokemon.firstEvo)"
            
            if pokemon.firstEvoLvl != "" {
                str += " - LVL. \(pokemon.firstEvoLvl)"
            }
        }
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backPressed", sender: self)
    }

}