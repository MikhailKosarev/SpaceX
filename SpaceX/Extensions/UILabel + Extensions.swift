//
//  UILabel + Extensions.swift
//  SpaceX
//
//  Created by Mikhail on 29.10.2022.
//

import UIKit

extension UILabel {
    static func makeRegular16(text: String = "") -> UILabel {
        let label = UILabel()
        label.font = .ralewayRegular16()
        label.text = text
        label.textColor = .specialTextF6F6F6
        return label
    }
}
