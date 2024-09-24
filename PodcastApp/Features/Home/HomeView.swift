//
//  HomeView.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 20.09.2024.
//  
//

import UIKit
import SnapKit

final class HomeView: BaseView<HomeViewController> {
    
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
    }

    /// sample method to setup layout
    private lazy var podcastTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private func setupLayout() {
        addSubview(podcastTitleLabel)
    }
    
    func setupConstraints() {
        podcastTitleLabel.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
