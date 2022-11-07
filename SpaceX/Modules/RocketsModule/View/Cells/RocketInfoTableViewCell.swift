//
//  rocketInfoTableView.swift
//  SpaceX
//
//  Created by Mikhail on 26.10.2022.
//

import UIKit

class RocketInfoTableViewCell: UITableViewCell {
    
    // MARK: - Static properties
    static let reuseID = "RocketInfoTableViewCell"
    
    // MARK: - Declare UI elements
    private let titleLabel = UILabel.makeLabel(text: "First flight",
                                               font: .ralewayRegular16(),
                                               color: .specialTextCACACA,
                                               alignment: .left)
    
    private let valueLabel = UILabel.makeLabel(text: "2010-06-04",
                                               font: .ralewayRegular16(),
                                               color: .specialTextF6F6F6)
    
    private lazy var infoStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                    valueLabel])
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .black
        addSubview(infoStackView)
    }
}


// MARK: - setConstraints
extension RocketInfoTableViewCell {
    private func setConstraints() {
        // set contentHuggingPriority to fix ambiguous width
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        infoStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}
