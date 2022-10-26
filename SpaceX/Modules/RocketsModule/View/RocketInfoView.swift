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
    
    private let rocketSizeCollectionView: UICollectionView = {
        //setup flow
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumInteritemSpacing = 12
        flow.itemSize = CGSize(width: 96, height: 96)
        
        // setup collectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setCollectionView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .black
        addSubview(titleStackView)
        addSubview(rocketSizeCollectionView)
    }
    
    private func setCollectionView() {
        rocketSizeCollectionView.dataSource = self
        rocketSizeCollectionView.delegate = self
        rocketSizeCollectionView.register(RocketSizeCollectionViewCell.self, forCellWithReuseIdentifier: RocketSizeCollectionViewCell.reuseID)
    }
    
    @objc private func settingsButtonTapped() {
        print(#function)
    }
}

extension RocketInfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = rocketSizeCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                                    RocketSizeCollectionViewCell.reuseID,
                                                                   for: indexPath) as? RocketSizeCollectionViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension RocketInfoView: UICollectionViewDelegate {
    
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
        
        rocketSizeCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(layoutMarginsGuide)
            make.top.equalTo(titleStackView.snp.bottom).offset(32)
            make.trailing.equalToSuperview()
            make.height.equalTo(96)
        }
    }
}
