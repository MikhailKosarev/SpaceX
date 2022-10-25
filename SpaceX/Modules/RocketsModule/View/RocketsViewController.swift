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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rocketInfoView = RocketInfoView()
    
    
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
        view.addSubview(rocketImageView)
        view.addSubview(rocketInfoView)
    }
    
    private func setConstraints() {
        rocketImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        rocketInfoView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(250)
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
