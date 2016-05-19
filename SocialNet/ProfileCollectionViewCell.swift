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

    var profile: Profile!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 7.0
        
    }
    
    func configureProfileCell(profile: Profile){
        self.profile = profile
        
        cellLbl.text = "\(self.profile.username)"
        cellImgView.image = UIImage(named: "map")
    }
}
