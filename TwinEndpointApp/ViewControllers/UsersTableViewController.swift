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
    private let refreshControl = UIRefreshControl()
    private final let cellIdentifier = "UserCell"
    private final let detailsControllerIdentifier = "UserDetailsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.mainControllerTitle
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func fetchData() {
        let queryOne = QueryObject(requestType: .git)
        let queryTwo = QueryObject(requestType: .dailyMotion)
        
        networkLayer.requestMultipleEndpoints(queryItems:[queryOne, queryTwo]) { (gitHubUsers:GitHubUsers?, dailyMotionResponse:DailyMotionUserResponse?, errorString) in
            if let error = errorString {
                self.displayToast(error)
            }
            if let gitHubUsers = gitHubUsers {
                self.dataSource.append(contentsOf: gitHubUsers)
            }
            if let dailyMotionUsers = dailyMotionResponse?.users {
                self.dataSource.append(contentsOf: dailyMotionUsers)
            }
            self.changeLoading(false)
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
}

extension UsersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count == 0 ? setEmptyView() : tableView.restoreNormalView()
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for: indexPath) as! UserCell
        cell.model = model
        cell.selectionStyle = .none
        return cell
    }
    
    func setEmptyView() {
        tableView.setEmptyView(title: Constants.noUsers, message: Constants.noUsersDescription)
    }
}

extension UsersTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsController = storyboard.instantiateViewController(withIdentifier: detailsControllerIdentifier) as! UserDetailsViewController
        detailsController.model = model
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
}

