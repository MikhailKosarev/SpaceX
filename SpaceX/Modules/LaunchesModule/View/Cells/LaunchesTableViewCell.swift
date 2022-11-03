//
//  LaunchesTableViewCell.swift
//  SpaceX
//
//  Created by Mikhail on 30.10.2022.
//

import UIKit
import SnapKit

class LaunchesTableViewCell: UITableViewCell {
    
    // MARK: - Static properties
    static let reuseID = "LaunchesTableViewCell"
    
    // MARK: - Declare UI elements
    private let nameLabel = UILabel.makeLabel(text: "FalconSat",
                                              font: .ralewayRegular20(),
                                              color: .white,
                                              alignment: .left)
    
    private let dateLabel  = UILabel.makeLabel(text: "24 March 2006",
                                               font: .ralewayRegular16(),
                                               color: .specialText8E8E8F,
                                               alignment: .left)
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       dateLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let launchResultImageView: UIImageView = {
        let image = UIImage(named: "successLaunch")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var launchStackView = UIStackView(arrangedSubviews: [descriptionStackView,
                                                                     launchResultImageView])
    
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
        backgroundColor = .specialBackground212121
        addSubview(launchStackView)
    }
    
    private func setConstraints() {
        // setup margins
        contentView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        
        // launchResultImageView
        launchResultImageView.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
        // launchStackView
        launchStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.layoutMarginsGuide)
        }
    }
    
}
