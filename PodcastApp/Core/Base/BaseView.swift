//
//  BaseView.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 20.09.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView {
    
    var controller: T

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        setupView()
    }

    func setupView() { }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
