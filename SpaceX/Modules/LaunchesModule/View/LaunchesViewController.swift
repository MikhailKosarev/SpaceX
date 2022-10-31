//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Mikhail on 30.10.2022.
//

import UIKit
import SnapKit

class LaunchesViewController: UIViewController {
    
    // MARK: - Declare UI elements
    private let titleLabel = UILabel.makeRegular16(text: "Falcon Heavy")
    
    private let launchesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.allowsSelection = false
        tableView.bounces = true
        return tableView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLaunchesTableView()
        setConstraints()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(launchesTableView)
        title = "Falcon heavy"
    }
    
    private func setupLaunchesTableView() {
        launchesTableView.register(LaunchesTableViewCell.self,
                                   forCellReuseIdentifier: LaunchesTableViewCell.reuseID)
        launchesTableView.dataSource = self
        launchesTableView.delegate = self
    }
    
    private func setConstraints() {
        // set custom margins
        view.layoutMargins = UIEdgeInsets(top: 48, left: 32, bottom: 0, right: 32)
        
        // launchesTableView
        launchesTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.layoutMarginsGuide)
        }
    }
}


// MARK: - UITableViewDataSource
extension LaunchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = launchesTableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.reuseID, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        // set padding betwen cells
        let verticalPadding: CGFloat = 16

        // setup padding and cornerRadius
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 24
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}


// MARK: - UITableViewDelegate
extension LaunchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        116
    }
}


// MARK: - Preview
#if DEBUG
import SwiftUI

struct LaunchesViewController_Preview: PreviewProvider {
    static var previews: some View {
        LaunchesViewController().showPreview()
    }
}
#endif
