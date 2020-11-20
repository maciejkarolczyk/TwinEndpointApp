//
//  DailymotionUserModel.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import Foundation

// MARK: - DailyMotionUserResponse
struct DailyMotionUserResponse: Codable {
    let page, limit: Int
    let explicit: Bool
    let total: Int
    let hasMore: Bool
    let users: [DailyMotionUser]

    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case users = "list"
    }
}

// MARK: - DailyMotionUser
struct DailyMotionUser: BaseUser, Codable {
    let avatarUrl: String
    let username: String
    var modelType: UserType = .dailyMotion

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_360_url"
        case username
    }
    
    func getUserName() -> String {return username}
    func getAvatarUrl() -> String {return avatarUrl}
    func getNodeId() -> String? {return nil}
    func getAccountType() -> TypeEnum? {return nil}
    func getWebSite() -> String? {return nil}
    func isUserSiteAdmin() -> Bool? {return nil}
}
