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
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameLabel.text = "\(pokemon.name.uppercaseString)"
    }

    @IBAction func backBtnPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backPressed", sender: self)
    }

}