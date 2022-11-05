//
//  rocketSizeCollectionViewCell.swift
//  SpaceX
//
//  Created by Mikhail on 26.10.2022.
//

import UIKit

class RocketSizeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Static properties
    static let reuseID = "RocketSizeCollectionViewCell"
    
    // MARK: - Declare UI elements
    private let valueLabel = UILabel.makeLabel(text: "229.6",
                                               font: .ralewaySemiBold16(),
                                               color: .white)
    
    private let descriptionLabel = UILabel.makeLabel(text: "Height, ft",
                                                      font: .ralewayRegular14(),
                                                      color: .specialText9F9FA0)
    
    private lazy var sizeStackView = UIStackView(arrangedSubviews: [valueLabel,
                                                                    descriptionLabel],
                                                 axis: .vertical,
                                                 alignment: .center)
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .specialBackground212121
        addSubview(sizeStackView)
        layer.cornerRadius = 32
    }
    
    private func setConstraints() {
        // set custom margins
        layoutMargins = UIEdgeInsets(top: 28, left: 8, bottom: 24, right: 8)
        
        // set constraints
        // set contentHuggingPriority to fix ambiguous height
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        sizeStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(layoutMarginsGuide)
        }
    }
}
