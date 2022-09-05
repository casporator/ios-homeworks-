//
//  extension.swift
//  Navigation
//
//  Created by Oleg Popov on 06.09.2022.
//

import Foundation
import UIKit

extension UIView {

func toAutoLayout() {
    translatesAutoresizingMaskIntoConstraints = false
}

func addSubviews(_ subviews: UIView...) {
    subviews.forEach { addSubview($0) }
}
}
