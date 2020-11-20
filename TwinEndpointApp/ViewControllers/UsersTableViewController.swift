//
//  ViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import UIKit

class UsersTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: Users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
        let queryOne = QueryObject(requestType: .git)
        let queryTwo = QueryObject(requestType: .dailyMotion)
        
        networkLayer.requestMultipleEndpoints(queryItems:[queryOne, queryTwo]) { (gitHubUsers:GitHubUsers?, dailyMotionResponse:DailyMotionUserResponse?, errorString) in
            if let error = errorString {
                print(error)
            }
            if let gitHubUsers = gitHubUsers {
                self.users.gitHub = gitHubUsers
            }
            if let dailyMotionUsers = dailyMotionResponse?.users {
                self.users.dailymotion = dailyMotionUsers
            }
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            
        }
    }


}

extension UsersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = users.gitHub.count + users.dailymotion.count
        count == 0 ? setNoFavoritesView() : tableView.restoreNormalView()
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
//        cell.delegate = self
//        cell.selectionStyle = .none
//        cell.articleModel = articles?[indexPath.row]
//        cell.changeAbstractLength(shouldExpand: expandedIndexSet.contains(indexPath.row))
//        return cell
        return UITableViewCell()
    }
    
    func setNoFavoritesView() {
        tableView.setEmptyView(title: "no users", message: "description")
    }
}

