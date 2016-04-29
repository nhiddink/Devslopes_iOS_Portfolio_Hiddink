//
//  ClosedPokedexViewController.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/28/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class PokedexClosedViewController: UIViewController, UIGestureRecognizerDelegate {
 
    @IBOutlet weak var bgImgClosed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aSelector: Selector = #selector(PokedexClosedViewController.swipeRight(_:))
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: aSelector)
        recognizer.direction = UISwipeGestureRecognizerDirection.Right
        bgImgClosed.addGestureRecognizer(recognizer)
    }
    
    func swipeRight(sender: AnyObject){
        self.performSegueWithIdentifier("swipeSegue", sender: self)
    }
    
}