//
//  RocketInfoView.swift
//  SpaceX
//
//  Created by Mikhail on 25.10.2022.
//

import UIKit
import SnapKit


// MARK: - protocol RocketInfoViewDelegate
protocol RocketInfoViewDelegate: AnyObject {
    func settingsButtonTapped()
    func showLaunchedButtonTapped()
}


// MARK: - RocketInfoView
class RocketInfoView: UIView {
    
    // MARK: - Declare UI elements
    private let rocketNameLabel = UILabel.makeLabel(text: "Falcon Heavy",
                                                    font: .ralewayRegular24(),
                                                    color: .specialTextF6F6F6)
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .specialTextCACACA
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleStackView = UIStackView(arrangedSubviews: [rocketNameLabel,
                                                                     settingsButton])
    
    private let rocketSizeCollectionView: UICollectionView = {
        //setup flow
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumInteritemSpacing = Constants.spacing12
        flow.itemSize = CGSize(width: Constants.width96, height: Constants.height96)
        
        // setup collectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.contentInset = .init(top: Constants.inset0,
                                            left: Constants.inset32,
                                            bottom: Constants.inset0,
                                            right: Constants.inset32)
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
        button.layer.cornerRadius = Constants.cornerRadius16
        button.addTarget(self, action: #selector(showLaunchedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public properties
    weak var delegate: RocketInfoViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
        setupTableView()
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
    
    private func setupCollectionView() {
        rocketSizeCollectionView.dataSource = self
        rocketSizeCollectionView.delegate = self
        rocketSizeCollectionView.register(RocketSizeCollectionViewCell.self,
                                          forCellWithReuseIdentifier: RocketSizeCollectionViewCell.reuseID)
    }
    
    private func setupTableView() {
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
        layoutMargins = UIEdgeInsets(top: Constants.inset48,
                                     left: Constants.inset32,
                                     bottom: Constants.inset0,
                                     right: Constants.inset32)
        
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
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleStackView.snp.bottom).offset(Constants.offset32)
            make.height.equalTo(Constants.height96)
        }
        // rocketInfoTableView
        rocketInfoTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.top.equalTo(rocketSizeCollectionView.snp.bottom).offset(Constants.offset16)
            make.height.equalTo(Constants.height500)
        }
        // showLaunchesButton
        showLaunchesButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(layoutMarginsGuide)
            make.top.equalTo(rocketInfoTableView.snp.bottom).offset(Constants.offset40)
            make.height.equalTo(Constants.height48)
        }
    }
}


// MARK: - Selector methods
extension RocketInfoView {
    @objc private func settingsButtonTapped() {
        delegate?.settingsButtonTapped()
        print(#function)
    }
    
    @objc private func showLaunchedButtonTapped() {
        delegate?.showLaunchedButtonTapped()
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
        let cell = rocketInfoTableView.dequeueReusableCell(withIdentifier: RocketInfoTableViewCell.reuseID, for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
}


// MARK: - UITableViewDelegate
extension RocketInfoView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.height40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 0 {
            return Constants.height40
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
