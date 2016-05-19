//
//  HomeViewController.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/18/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hometableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hometableView.delegate = self
        hometableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Insert Address Here"
        cell.detailTextLabel?.text = "Social Network HQ"
        
        return cell
        
    }
    
}
