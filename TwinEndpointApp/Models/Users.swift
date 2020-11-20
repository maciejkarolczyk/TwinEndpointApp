//
//  Users.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation

protocol BaseUser {
    var modelType: UserType { get set}
}

class Users {
    
    var gitHub: [GitHubUserElement] = []
    var dailymotion: [DailyMotionUser] = []
}
