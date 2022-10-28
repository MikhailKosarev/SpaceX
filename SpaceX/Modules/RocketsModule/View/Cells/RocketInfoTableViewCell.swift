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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ralewayRegular16()
        label.textColor = .specialTextCACACA
        label.text = "First flight"
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .ralewayRegular16()
        label.textColor = .specialTextF6F6F6
        label.text = "2010-06-04"
        
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                      valueLabel])
        return stackView
    }()
    
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
    
    private func setConstraints() {
        infoStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}
