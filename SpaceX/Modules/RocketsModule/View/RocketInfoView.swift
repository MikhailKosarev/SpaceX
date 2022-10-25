//
//  RocketInfoView.swift
//  SpaceX
//
//  Created by Mikhail on 25.10.2022.
//

import UIKit

class RocketInfoView: UIView {
    
    // MARK: - Declare UI elements
    private let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0)
        label.text = "Falcon Heavy"
        label.textColor = .white
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rocketNameLabel,
                                                       settingsButton])
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setDelegates()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .black
        addSubview(titleStackView)
        
    }
    
    private func setDelegates() {
        
    }
    
    @objc private func settingsButtonTapped() {
        print(#function)
    }
}

// MARK: - setConstraints
extension RocketInfoView {
    private func setConstraints() {
        // set custom margins
        layoutMargins = UIEdgeInsets(top: 48, left: 32, bottom: 0, right: 32)
        
        // settingsButton
        settingsButton.snp.makeConstraints { make in
            make.height.equalTo(settingsButton.snp.width)
        }
        
        // titleStackView
        titleStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(layoutMarginsGuide)
        }
    }
}
