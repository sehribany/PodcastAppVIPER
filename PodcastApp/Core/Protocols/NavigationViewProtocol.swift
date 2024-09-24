//
//  NavigationViewProtocol.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 20.09.2024.
//

import UIKit

protocol NavigationView {
    func present(_ viewController: UIViewController)
    func dismiss()
}

extension NavigationView where Self: UIViewController {
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    func dismiss() {
        dismiss(animated: true)
    }
}