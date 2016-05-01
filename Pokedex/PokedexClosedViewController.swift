//
//  ClosedPokedexViewController.swift
//  Pokedex
//
//  Created by Neil Hiddink on 4/28/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class PokedexClosedViewController: UIViewController, UIGestureRecognizerDelegate {
 
    var location = CGPoint(x: 0, y: 0)
    
    @IBOutlet weak var lockImg: UIImageView!
    @IBOutlet weak var swipeImg: UIImageView!
    @IBOutlet weak var pokedexClosedImg: UIImageView!
    @IBOutlet weak var pokedexCoverImg: UIImageView!
    @IBOutlet weak var pokedexTitleImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.swipeImg.alpha = 0
    }
    
    @IBAction func swipeRight(recognizer: UISwipeGestureRecognizer) {
        
        var location = recognizer.locationInView(view)
        location.x += 250.0
        self.pokedexTitleImg.alpha = 0.0
        
        UIView.animateWithDuration(0.8, delay: 0, options: .CurveEaseOut, animations: {
            self.lockImg.alpha = 0.1
            self.pokedexClosedImg.alpha = 0.0
            self.lockImg.center = location
            self.pokedexCoverImg.center = CGPoint(x: self.pokedexCoverImg.center.x + 250, y: self.pokedexCoverImg.center.y)
            },
                                   completion: {(finished: Bool) in
                                    UIView.animateWithDuration(0.08, animations: {
                                        self.lockImg.alpha = 0.0
                                        self.pokedexCoverImg.alpha = 0.0
                                        self.performSegueWithIdentifier("swipeSegue", sender: self)
                                    })
            }
        )
    }
    
}