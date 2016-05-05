//
//  ViewController.swift
//  TheWalkingDead
//
//  Created by Neil Hiddink on 5/3/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var characters: [String] = ["Rick Grimes", "Carl Grimes", "Morgan Jones", "Michonne", "The Governor",  "Merle Dixon", "Daryl Dixon", "Carol Peletier", "Glenn Rhee", "Maggie Greene", "Hershel Greene", "Abraham Ford"]
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let WIDTH: CGFloat = 303
    let HEIGHT: CGFloat = 330
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 1...12 {
            let character = UIImage(named: "\(x)")
            let characterImg = UIImageView(image: character)
            scrollView.addSubview(characterImg)
            
            characterImg.frame = CGRectMake(-WIDTH + (1.5 * WIDTH * CGFloat(x)), 150, WIDTH, HEIGHT)
            
            scrollView.contentSize = CGSizeMake(WIDTH * 12, scrollView.frame.size.height)
            
            
        }
        
    }
    
}

