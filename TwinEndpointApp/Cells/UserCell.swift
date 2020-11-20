//
//  UserCell.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit

class UserCell:UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userTypeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(type:UserType, avatarUrl:String, userName:String) {
        let url = URL(string: avatarUrl)
//        avatarImageView.kf.setImage(with: url)
        nameLabel.text = userName
        
    }
    
}
