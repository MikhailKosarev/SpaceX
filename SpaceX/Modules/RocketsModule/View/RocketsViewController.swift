//
//  ViewController.swift
//  SpaceX
//
//  Created by Mikhail on 22.10.2022.
//

import UIKit
import SnapKit

class RocketsViewController: UIViewController {
    
    // MARK: - Declaring UI elesetupViewments
    private let rocketImageView: UIImageView = {
        let image = UIImage(named: "mockRocket")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let rocketInfoView = RocketInfoView()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(rocketInfoView)
        return scrollView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rocketInfoView.layer.cornerRadius = 32
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(mainScrollView)
    }
    
    private func setConstraints() {
        // contentGuide for mainScrollView
        let contentGuide = mainScrollView.contentLayoutGuide
        
        // mainScrollView
        mainScrollView.snp.makeConstraints { make in
//            make.leading.top.trailing.bottom.equalToSuperview()
            make.edges.equalToSuperview()
            make.width.equalTo(contentGuide.snp.width)
        }
        
        // rocketImageView
        rocketImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(contentGuide)
            make.height.equalTo(300)
        }
        
        // rocketInfoView
        rocketInfoView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(contentGuide)
            make.top.equalTo(mainScrollView).offset(250)
        }
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
