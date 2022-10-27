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
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .ralewaySemiBold16()
        label.text = "229.6"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.6250903606, green: 0.6252030134, blue: 0.6286859512, alpha: 1)
        label.font = .ralewayRegular14()
        label.text = "Height, ft"
        return label
    }()
    
    private lazy var sizeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [valueLabel,
                                                      descriptionLabel])
//        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
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
        backgroundColor = #colorLiteral(red: 0.1726317704, green: 0.1726317704, blue: 0.1726317704, alpha: 1)
        addSubview(sizeStackView)
        layer.cornerRadius = 32
    }
    
    private func setConstraints() {
        // set custom margins
        layoutMargins = UIEdgeInsets(top: 28, left: 8, bottom: 24, right: 8)
        
        // set constraints
        sizeStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(layoutMarginsGuide)
        }
    }
}
