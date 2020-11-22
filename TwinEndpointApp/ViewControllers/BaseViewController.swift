//
//  BaseViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit
import MultiNetworking

class BaseViewController: UIViewController {
    
    var networkLayer : MultiNetworkingManager = MultiNetworkingManager()
    let loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        return loading
    }()
    
    // Maciej: cannot inject networking layer in initWithCoder on iOS < 13.0. Therefore, no dependency injection here
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        changeLoading(true)
    }
    
    func setupLayout() {
        if #available(iOS 13, *) {
            self.view.backgroundColor = .systemBackground
        } else {
            self.view.backgroundColor = .white
        }
        
        view.addSubview(loading)
        loading.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func changeLoading(_ shouldShow:Bool) {
        DispatchQueue.main.async {
            shouldShow ? self.loading.startAnimating() : self.loading.stopAnimating()
        }
    }
    
    func displayToast(_ text:String) {
        DispatchQueue.main.async {
            Toast.show(message: text, controller: self)
        }
    }
}
