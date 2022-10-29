//
//  UISegmentedControl + Extension.swift
//  SpaceX
//
//  Created by Mikhail on 29.10.2022.
//

import UIKit

extension UISegmentedControl {
    static func makeSettings(items: [String]) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = .specialBackground212121
        
        // title color
        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.specialText8E8E8F]
        segmentedControl.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.specialText121212]
        segmentedControl.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        
        segmentedControl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        segmentedControl.apportionsSegmentWidthsByContent = false
        
        // set width of segments
        segmentedControl.setWidth(56, forSegmentAt: 0)
        segmentedControl.setWidth(56, forSegmentAt: 1)
        return segmentedControl
    }
}
