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
    @IBOutlet weak var shelfImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(shelfImg)
        
        shelfImg.frame = CGRectMake(0, 0, scrollView.frame.size.width, 70)
        
        for x in 1...12 {
            
            let character = UIImage(named: "\(x)")
            let characterImg = UIImageView(image: character)
            let HEIGHT = scrollView.frame.size.height/2
            let WIDTH = HEIGHT * 0.75
            characterImg.frame = CGRectMake(((-scrollView.frame.size.width + (scrollView.frame.size.width * CGFloat(x))) + 50), 225, WIDTH, HEIGHT)
            scrollView.addSubview(characterImg)
            
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * CGFloat(12), scrollView.frame.size.height)
        
        }
        
        
    }
    
}

