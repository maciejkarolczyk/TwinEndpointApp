//
//  Constants.swift
//  MultiNetworking
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import Foundation

struct Constants {
    
    static let genericError = "Something went wrong with fetching from"
    static let noConnectionError = "Not connected to Internet"
    
    static let dailyMotionEndpoint = "https://api.dailymotion.com/users?fields=avatar_360_url,username"
    static let gitHubUsersEndpoint = "https://api.github.com/users"
}
