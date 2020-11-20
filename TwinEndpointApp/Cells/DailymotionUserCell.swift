//
//  DailymotionUserCell.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit

class DailymotionUserCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userTypeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ model:DailyMotionUser) {
        let url = URL(string: model.avatarUrl)
        avatar.kf.setImage(with: url)
        nameLabel.text = model.username
        userTypeImage.image = UIImage(named: "dailymotion-logo")
    }
    
}
