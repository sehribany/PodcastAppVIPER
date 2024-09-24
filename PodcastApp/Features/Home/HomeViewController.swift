//
//  HomeViewController.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 20.09.2024.
//  
//

import UIKit

final class HomeViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView(self)
        view.backgroundColor = .white
    }
     
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.show(self, sender: nil)
    }
    
    // TODO: Implement View Output Methods
}
