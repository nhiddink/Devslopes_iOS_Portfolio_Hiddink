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
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var spAttackLabel: UILabel!
    @IBOutlet weak var spDefenseLabel: UILabel!
    @IBOutlet weak var currentEvoLabel: UILabel!
    @IBOutlet weak var nextEvoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var nextEvolution: UILabel!
    @IBOutlet weak var arrow:UIImageView!
    
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
        typeLabel.text = pokemon.type
        speciesLabel.text = pokemon.species
        heightLabel.text = "\(pokemon.height) m"
        weightLabel.text = "\(pokemon.weight) kg"
        descriptionLabel.text = pokemon.description
        hpLabel.text = pokemon.hp
        speedLabel.text = pokemon.speed
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        spAttackLabel.text = pokemon.spAttack
        spDefenseLabel.text = pokemon.spDefense
        currentEvoLabel.text = pokemon.nextEvo.uppercaseString
        
        if pokemon.currentEvoId == "" {
            currentEvoLabel.hidden = true
            nextEvoLabel.hidden = true
            arrow.hidden = true
            currentEvoImage.hidden = true
            nextEvoImage.hidden = true
            nextEvolution.text = "NEXT EVOLUTION: NONE"
            
        } else {
            currentEvoImage.hidden = false
            currentEvoImage.image = mainImg.image
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