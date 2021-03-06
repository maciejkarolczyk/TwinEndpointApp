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
struct DailyMotionUser: Codable {
    let avatarUrl: String
    let username: String
    var modelType: UserType = .dailyMotion

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_360_url"
        case username
    }
}
