//
//  UserCell.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit
import Kingfisher

class GitHubUserCell:UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userTypeImage: UIImageView!
    @IBOutlet weak var gitHubUserTypeLabel: UILabel!
    
    var model:GitHubUserElement?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ model:GitHubUserElement) {
        let url = URL(string: model.avatarURL)
        avatar.kf.setImage(with: url)
        nameLabel.text = model.login
        userTypeImage.image = UIImage(named: "github-logo")
        gitHubUserTypeLabel.text = model.type.rawValue
    }
    
}
