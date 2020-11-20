//
//  UserCell.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit
import Kingfisher

class UserCell:UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userTypeImage: UIImageView!
    @IBOutlet weak var gitHubUserTypeLabel: UILabel!
    
    var model:BaseUser? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell() {
        guard let model = model else {return}
        let url = URL(string: model.getAvatarUrl())
        avatar.kf.setImage(with: url)
        nameLabel.text = model.getUserName()
        switch model.modelType {
        case .git:
            userTypeImage.image = UIImage(named: "github-logo")
        case .dailyMotion:
        userTypeImage.image = UIImage(named: "dailymotion-logo")
        }
        gitHubUserTypeLabel.text = model.getAccountType()?.rawValue
    }
    
}
