//
//  RocketInfoView.swift
//  SpaceX
//
//  Created by Mikhail on 25.10.2022.
//

import UIKit

protocol RocketInfoViewDelegate: AnyObject {
    func settingsButtonTapped()
}

class RocketInfoView: UIView {
    
    // MARK: - Declare UI elements
    private let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = .ralewayRegular24()
        label.text = "Falcon Heavy"
        label.textColor = .specialTextF6F6F6
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .specialTextCACACA
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
    
    private let rocketInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.bounces = true
        return tableView
    }()
    
    private lazy var showLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show launches", for: .normal)
        button.setTitleColor(.specialTextF6F6F6, for: .normal)
        button.titleLabel?.font = .ralewaySemiBold16()
        button.backgroundColor = .specialBackground212121
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(showLaunchedButonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public properties
    weak var delegate: RocketInfoViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setCollectionView()
        setTableView()
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
        addSubview(rocketInfoTableView)
        addSubview(showLaunchesButton)
    }
    
    private func setCollectionView() {
        rocketSizeCollectionView.dataSource = self
        rocketSizeCollectionView.delegate = self
        rocketSizeCollectionView.register(RocketSizeCollectionViewCell.self,
                                          forCellWithReuseIdentifier: RocketSizeCollectionViewCell.reuseID)
    }
    
    private func setTableView() {
        rocketInfoTableView.dataSource = self
        rocketInfoTableView.delegate = self
        rocketInfoTableView.register(RocketInfoTableViewCell.self,
                                     forCellReuseIdentifier: RocketInfoTableViewCell.reuseID)
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
        
        // rocketSizeCollectionView
        rocketSizeCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(layoutMarginsGuide)
            make.top.equalTo(titleStackView.snp.bottom).offset(32)
            make.trailing.equalToSuperview()
            make.height.equalTo(96)
        }
        
        // rocketInfoTableView
        rocketInfoTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.top.equalTo(rocketSizeCollectionView.snp.bottom).offset(16)
            make.height.equalTo(500)
        }
        
        // showLaunchesButton
        showLaunchesButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(layoutMarginsGuide)
            make.top.equalTo(rocketInfoTableView.snp.bottom).offset(40)
            make.height.equalTo(48)
        }
    }
}


// MARK: - Selector methods
extension RocketInfoView {
    @objc private func settingsButtonTapped() {
        delegate?.settingsButtonTapped()
        print(#function)
    }
    
    @objc private func showLaunchedButonTapped() {
        print(#function)
    }
}


// MARK: - UICollectionViewDataSource
extension RocketInfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = rocketSizeCollectionView.dequeueReusableCell(withReuseIdentifier: RocketSizeCollectionViewCell.reuseID,
                                                                   for: indexPath) as? RocketSizeCollectionViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}


// MARK: - UICollectionViewDelegate
extension RocketInfoView: UICollectionViewDelegate {
    
}


// MARK: - UITableViewDataSource
extension RocketInfoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = rocketInfoTableView.dequeueReusableCell(withIdentifier: RocketInfoTableViewCell.reuseID)
        else { return UITableViewCell() }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
}


// MARK: - UITableViewDelegate
extension RocketInfoView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 0 {
            return 40
        } else {
            return 0
        }
    }
    
    // setup Header of tableView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let headerView = UIView()
            headerView.backgroundColor = .black
            let sectionLabel = UILabel()
            sectionLabel.font = .ralewaySemiBold16()
            sectionLabel.textColor = .white
            sectionLabel.text = "FIRST STAGE"
            headerView.addSubview(sectionLabel)
            return sectionLabel
        } else {
            return nil
        }
    }
}
