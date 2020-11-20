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
        self.title = Constants.detailsControllerTitle
        guard let model = model else {return}
        nameLabel.text = model.getUserName()
        avatarImageView.kf.setImage(with: URL(string: model.getAvatarUrl()))
        switch model.modelType {
        case .git:
            userTypeImageView.image = UIImage(named: Constants.gitHubIcon)
            nodeIdLabel.text = model.getNodeId()
            accountType.text = model.getAccountType()?.rawValue
            websiteLabel.text = model.getWebSite()
            if let isAdmin = model.isUserSiteAdmin() {
                isUserSiteAdminLabel.text = isAdmin ? Constants.adminString : Constants.userString
            }
        case .dailyMotion:
            userTypeImageView.image = UIImage(named: Constants.dailymotionIcon)
            detailsStackView.isHidden = true
        }
        changeLoading(false)
    }
}
