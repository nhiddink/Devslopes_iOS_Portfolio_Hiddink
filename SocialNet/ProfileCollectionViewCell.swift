//
//  ProfileCollectionViewCell.swift
//  SocialNet
//
//  Created by Neil Hiddink on 5/16/16.
//  Copyright © 2016 Neil Hiddink. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellImgView: UIImageView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        cellLbl.text = "Test"
        cellImgView.image = UIImage(named: "map.png")
    }
}
