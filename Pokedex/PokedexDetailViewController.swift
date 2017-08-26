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
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var spAttackLabel: UILabel!
    @IBOutlet weak var spDefenseLabel: UILabel!
    @IBOutlet weak var evolutionLvlLabel: UILabel!
    @IBOutlet weak var evolutionNameLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var nextEvoTitleLabel: UILabel!
    @IBOutlet weak var arrow:UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameLabel.text = "\(pokemon.name.uppercaseString)"
        if pokemon.pokedexId < 10 {
            pokedexIdLabel.text = "#00\(pokemon.pokedexId)"
        } else if pokemon.pokedexId < 100 {
            pokedexIdLabel.text = "#0\(pokemon.pokedexId)"
        } else {
            pokedexIdLabel.text = "#\(pokemon.pokedexId)"
        }
        mainImg.image = UIImage(named:"\(pokemon.pokedexId)")
        pokemon.downloadPokemonDetails { () -> () in
            //called after download is completed
            self.updateUI()
        }
        
    }

    func updateUI() {
        typeLabel.text = pokemon.type
        heightLabel.text = "\(pokemon.height) m"
        weightLabel.text = "\(pokemon.weight) kg"
        descriptionLabel.text = pokemon.description
        hpLabel.text = pokemon.hp
        speedLabel.text = pokemon.speed
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        spAttackLabel.text = pokemon.spAttack
        spDefenseLabel.text = pokemon.spDefense
        evolutionNameLabel.text = pokemon.nextEvoName.uppercaseString
        
        if pokemon.nextEvoId == "" {
            evolutionNameLabel.hidden = true
            evolutionLvlLabel.hidden = true
            arrow.hidden = true
            currentEvoImage.hidden = true
            nextEvoImage.hidden = true
            nextEvoTitleLabel.text = "NO FURTHER EVOLUTIONS"
            
        } else {
            currentEvoImage.hidden = false
            currentEvoImage.image = mainImg.image
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named:"\(pokemon.nextEvoId)")
            evolutionNameLabel.text = "\(pokemon.nextEvoName)"
            evolutionLvlLabel.text = pokemon.nextEvoLvl
        }
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backPressed", sender: self)
    }

}