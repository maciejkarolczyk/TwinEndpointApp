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
    func getUserName() -> String
    func getAvatarUrl() -> String
    func getNodeId() -> String?
    func getAccountType() -> TypeEnum?
    func getWebSite() -> String?
    func isUserSiteAdmin() -> Bool?
}
