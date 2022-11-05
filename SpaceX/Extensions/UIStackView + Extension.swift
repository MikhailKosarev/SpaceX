//
//  UIStackView + Extension.swift
//  SpaceX
//
//  Created by Mikhail on 05.11.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis = .horizontal,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     spacing: CGFloat = 0.0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}
