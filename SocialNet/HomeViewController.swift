//
//  HomeViewController.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/18/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hometableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hometableView.delegate = self
        hometableView.dataSource = self
        
        DataService.ds.REF_POSTS.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
            
                for snap in snapshots {
                    print("SNAP: \(snap)")
                
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDict)
                        self.posts.append(post)
                    }
                }
            }
            
            self.hometableView.reloadData()
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        //print(post.postDescription)
        
        if let cell = hometableView.dequeueReusableCellWithIdentifier("HomeTableCell") as? HomeTableCell {
            cell.configureCell(post)
            return cell
        } else {
            return HomeTableCell()
        }
    }
    
}
