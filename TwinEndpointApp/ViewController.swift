//
//  ViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queryOne = QueryObject(requestType: .git)
        let queryTwo = QueryObject(requestType: .dailyMotion)
        
        MultiNetworking.requestMultipleEndpoints(queryItems:[queryOne, queryTwo]) { (gitHubUsers:GitHubUsers, dailyMotionResponse:DailyMotionUserResponse) in
            print("done")
        } errorBlock: { errorString in
            print(errorString)
        }
        
    }


}

