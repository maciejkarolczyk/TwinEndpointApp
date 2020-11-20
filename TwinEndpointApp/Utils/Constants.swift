//
//  Constants.swift
//  MultiNetworking
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import Foundation

struct Constants {
    
    // MARK: - Error Messages
    static let genericError = "Something went wrong with fetching from"
    static let noConnectionError = "Not connected to Internet"
    static let parsingError = "Unable to parse the response in given type"
    
    // MARK: - Images
    static let gitHubIcon = "github-logo"
    static let dailymotionIcon = "dailymotion-logo"
    
    // MARK: - Endpoints
    static let dailyMotionEndpoint = "https://api.dailymotion.com/users?fields=avatar_360_url,username"
    static let gitHubUsersEndpoint = "https://api.github.com/users"
    
    static let mainControllerTitle = "Users List"
    static let detailsControllerTitle = "User Details"
}
