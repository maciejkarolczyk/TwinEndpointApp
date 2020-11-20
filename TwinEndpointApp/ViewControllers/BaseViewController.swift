//
//  BaseViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var networkLayer : MultiNetworking = MultiNetworking()
    let loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        return loading
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        changeLoading(true)
    }
    
    func setupLayout() {
        self.view.backgroundColor = .systemBackground
        view.addSubview(loading)
        loading.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func changeLoading(_ shouldShow:Bool) {
        DispatchQueue.main.async {
            shouldShow ? self.loading.startAnimating() : self.loading.stopAnimating()
        }
    }
}