//
//  DailymotionUserModel.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

//   let dailyMotionUserResponse = try? newJSONDecoder().decode(DailyMotionUserResponse.self, from: jsonData)

import Foundation

// MARK: - DailyMotionUserResponse
struct DailyMotionUserResponse: Codable, BaseProtocol {
    let page, limit: Int
    let explicit: Bool
    let total: Int
    let hasMore: Bool
    let list: [List]

    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case list
    }
}

// MARK: - List
struct List: Codable {
    let avatar360_URL: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case avatar360_URL = "avatar_360_url"
        case username
    }
}
