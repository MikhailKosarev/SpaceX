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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.addSubview(rocketImageView)
    }
    
    private func setConstraints() {
        rocketImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
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
