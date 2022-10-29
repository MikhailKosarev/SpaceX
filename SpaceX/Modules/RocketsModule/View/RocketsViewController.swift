//
//  ViewController.swift
//  SpaceX
//
//  Created by Mikhail on 22.10.2022.
//

import UIKit
import SnapKit

class RocketsViewController: UIViewController {
    
    // MARK: - Declaring UI elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never  // not for safeArea
        return scrollView
    }()
    
    // contentView for scrollView
    private let contentView = UIView()
    
    private let rocketImageView: UIImageView = {
        let image = UIImage(named: "mockRocket")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let rocketInfoView = RocketInfoView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rocketInfoView.layer.cornerRadius = 32
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(rocketImageView)
        contentView.addSubview(rocketInfoView)
    }
    
    private func setDelegates() {
        rocketInfoView.delegate = self
    }
    
    private func setConstraints() {
        // scrollView
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // contentView
        contentView.snp.makeConstraints { make in
            make.edges.width.equalTo(scrollView)

        }
        // rocketImageView
        rocketImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(contentView)
            make.height.equalTo(300)
        }
        // rocketInfoView
        rocketInfoView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(contentView)
            make.top.equalTo(scrollView).offset(250)
        }
    }
}


// MARK: - RocketInfoViewDelegate
extension RocketsViewController: RocketInfoViewDelegate {
    func settingsButtonTapped() {
        let settingsViewController = SettingsViewController()
        settingsViewController.modalPresentationStyle = .pageSheet
        present(settingsViewController, animated: true)
    }
}


// MARK: - Preview
#if DEBUG
import SwiftUI

struct RocketsViewController_Preview: PreviewProvider {
    static var previews: some View {
        RocketsViewController().showPreview()
    }
}
#endif
