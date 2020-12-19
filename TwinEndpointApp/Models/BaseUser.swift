//
//  Users.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation

enum UserType : String {
    case git, dailyMotion
}

protocol BaseUser {
    var modelType:UserType { get set}
    var userName:String {get}
    var avatarUrl:String {get}
    var nodeId:String? {get}
    var accountType:TypeEnum? {get}
    var webSite:String? {get}
    var isUserSiteAdmin:Bool? {get}
}

struct User:BaseUser {
    var modelType: UserType
    var userName: String
    var avatarUrl: String
    var nodeId: String?
    var accountType: TypeEnum?
    var webSite: String?
    var isUserSiteAdmin: Bool?
    
    init(_ model:GitHubUserElementNetworkModel) {
        modelType = model.modelType
        userName = model.login
        avatarUrl = model.avatarURL
        nodeId = model.nodeID
        accountType = model.type
        webSite = model.htmlURL
        isUserSiteAdmin = model.siteAdmin
    }
    
    init(_ model:DailyMotionUser) {
        modelType = model.modelType
        userName = model.username
        avatarUrl = model.avatarUrl
        nodeId = nil
        accountType = nil
        webSite = nil
        isUserSiteAdmin = nil
    }
}
