//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Mikhail on 29.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Declare UI elements
    private let titleLabel = UILabel.makeLabel(text: "Settings",
                                               font: .ralewayRegular16(),
                                               color: .specialTextF6F6F6)
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = .ralewaySemiBold16()
        button.tintColor = .specialTextF6F6F6
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // height
    private let heightLabel = UILabel.makeLabel(text: "Height",
                                                font: .ralewayRegular16(),
                                                color: .specialTextF6F6F6,
                                                alignment: .left)
    private lazy var heightSegmentedControl = UISegmentedControl.makeSettings(items: ["m", "ft"])
    private lazy var heightStackView = UIStackView(arrangedSubviews: [heightLabel,
                                                                     heightSegmentedControl])
    
    // diameter
    private let diameterLabel = UILabel.makeLabel(text: "Diameter",
                                                  font: .ralewayRegular16(),
                                                  color: .specialTextF6F6F6,
                                                  alignment: .left)
    private lazy var diameterSegmentedControl = UISegmentedControl.makeSettings(items: ["m", "ft"])
    private lazy var diameterStackView = UIStackView(arrangedSubviews: [diameterLabel,
                                                                        diameterSegmentedControl])
    
    // mass
    private let massLabel = UILabel.makeLabel(text: "Mass",
                                              font: .ralewayRegular16(),
                                              color: .specialTextF6F6F6,
                                              alignment: .left)
    private lazy var massSegmentedControl = UISegmentedControl.makeSettings(items: ["kg", "lb"])
    private lazy var massStackView = UIStackView(arrangedSubviews: [massLabel,
                                                                    massSegmentedControl])
    
    // payload
    private let payloadWeightsLabel = UILabel.makeLabel(text: "Payload weights",
                                                        font: .ralewayRegular16(),
                                                        color: .specialTextF6F6F6,
                                                        alignment: .left)
    private lazy var payloadWeightsSegmentedControl = UISegmentedControl.makeSettings(items: ["kg", "lb"])
    private lazy var payloadWeightsStackView = UIStackView(arrangedSubviews: [payloadWeightsLabel,
                                                                              payloadWeightsSegmentedControl])
    
    private lazy var settingsStackView = UIStackView(arrangedSubviews: [heightStackView,
                                                                        diameterStackView,
                                                                        massStackView,
                                                                        payloadWeightsStackView],
                                                     axis: .vertical,
                                                     spacing: 24.0)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addtargets()
        setConstraints()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(settingsStackView)
    }
    
    private func addtargets() {
        heightSegmentedControl.addTarget(self, action: #selector(heightSegmentedValueChanged), for: .valueChanged)
        diameterSegmentedControl.addTarget(self, action: #selector(diameterSegmentedValueChanged), for: .valueChanged)
        massSegmentedControl.addTarget(self, action: #selector(massSegmentedValueChanged), for: .valueChanged)
        payloadWeightsSegmentedControl.addTarget(self, action: #selector(payloadWeightsSegmentedValueChanged), for: .valueChanged)
    }
}


// MARK: - setConstraints
extension  SettingsViewController {
    private func setConstraints() {
        // set custom margins
        view.layoutMargins = UIEdgeInsets(top: Constants.inset48,
                                          left: Constants.inset32,
                                          bottom: Constants.inset0,
                                          right: Constants.inset32)
        
        // titleLabel
        titleLabel.snp.makeConstraints { make in
            make.firstBaseline.equalTo(closeButton)
            make.centerX.equalToSuperview()
        }
        // closeButton
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.offset18)
            make.trailing.equalTo(view.layoutMarginsGuide)
        }
        // settingsStackView
        settingsStackView.snp.makeConstraints { make in
            make.top.equalTo(closeButton).offset(Constants.offset75)
            make.leading.trailing.equalTo(view.layoutMarginsGuide)
        }
    }
}


// MARK: - Selector methods
extension SettingsViewController {
    @objc private func closeButtonTapped() {
        print(#function)
        dismiss(animated: true)
    }
    
    @objc private func heightSegmentedValueChanged() {
        print(#function)
    }
    
    @objc private func diameterSegmentedValueChanged() {
        print(#function)
    }
    
    @objc private func massSegmentedValueChanged() {
        print(#function)
    }
    
    @objc private func payloadWeightsSegmentedValueChanged() {
        print(#function)
    }
}



// MARK: - Preview
#if DEBUG
import SwiftUI

struct SettingsViewController_Preview: PreviewProvider {
    static var previews: some View {
        SettingsViewController().showPreview()
    }
}
#endif
