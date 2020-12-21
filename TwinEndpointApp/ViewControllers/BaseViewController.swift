//
//  BaseViewController.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 20/11/2020.
//

import Foundation
import UIKit
import MultiNetworking

protocol NetworkingProtocol {
    var networkLayer:MultiNetworkingManager { get }
}

class BaseViewController: UIViewController, NetworkingProtocol {
    
    var networkLayer: MultiNetworkingManager
    let loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        return loading
    }()
    
    init?(coder: NSCoder, networkLayer: MultiNetworkingManager) {
        self.networkLayer = networkLayer
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(networkLayer: MultiNetworkingManager) {
        self.networkLayer = networkLayer
        super.init(nibName: nil, bundle: nil)
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
