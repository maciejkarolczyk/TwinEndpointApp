//
//  UserDetailsViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit

class UserDetailsViewController: BaseViewController {
    
    var model:BaseUser?
    
    @IBOutlet weak var avatarImageView: RoundedCornersView!
    @IBOutlet weak var userTypeImageView: RoundedCornersView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!
    
    @IBOutlet weak var nodeIdLabel: UILabel!
    @IBOutlet weak var accountType: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var isUserSiteAdminLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = model else {return}
        nameLabel.text = model.getUserName()
        avatarImageView.kf.setImage(with: URL(string: model.getAvatarUrl()))
        switch model.modelType {
        case .git:
            userTypeImageView.image = UIImage(named: "github-logo")
            nodeIdLabel.text = model.getNodeId()
            accountType.text = model.getAccountType()?.rawValue
            websiteLabel.text = model.getWebSite()
            isUserSiteAdminLabel.text = model.isUserSiteAdmin()! ? "Admin" : "just a user"
        case .dailyMotion:
            userTypeImageView.image = UIImage(named: "dailymotion-logo")
            detailsStackView.isHidden = true
        }
        changeLoading(false)
        
    }
    
    
}
