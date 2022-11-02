//
//  UILabel + Extensions.swift
//  SpaceX
//
//  Created by Mikhail on 29.10.2022.
//

import UIKit

extension UILabel {
    static func makeLabel(text: String = "",
                          font: UIFont?,
                          color: UIColor,
                          alignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        return label
    }
}
