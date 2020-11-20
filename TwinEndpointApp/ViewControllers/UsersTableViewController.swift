//
//  ViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import UIKit

class UsersTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [BaseUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GitHub/Dailymotion Users"
        setupTableView()
        
        let queryOne = QueryObject(requestType: .git)
        let queryTwo = QueryObject(requestType: .dailyMotion)
        
        networkLayer.requestMultipleEndpoints(queryItems:[queryOne, queryTwo]) { (gitHubUsers:GitHubUsers?, dailyMotionResponse:DailyMotionUserResponse?, errorString) in
            if let error = errorString {
                print(error)
            }
            if let gitHubUsers = gitHubUsers {
                self.dataSource.append(contentsOf: gitHubUsers)
            }
            if let dailyMotionUsers = dailyMotionResponse?.users {
                self.dataSource.append(contentsOf: dailyMotionUsers)
            }
            self.changeLoading(false)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
}

extension UsersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count == 0 ? setNoFavoritesView() : tableView.restoreNormalView()
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        let cell:UITableViewCell
        switch model.modelType {
        case .git:
            cell = tableView.dequeueReusableCell(withIdentifier: "GitHubUserCell", for: indexPath) as! GitHubUserCell
            (cell as! GitHubUserCell).setupCell(model as! GitHubUserElement)
        case .dailyMotion:
            cell = tableView.dequeueReusableCell(withIdentifier: "DailymotionUserCell", for: indexPath) as! DailymotionUserCell
            (cell as! DailymotionUserCell).setupCell(model as! DailyMotionUser)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func setNoFavoritesView() {
        tableView.setEmptyView(title: "no users", message: "description")
    }
}

extension UsersTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        //create detailsController and push
    }
}

