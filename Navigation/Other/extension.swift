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

    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blureEffectView = UIVisualEffectView(effect: blurEffect)
        blureEffectView.frame = bounds
        blureEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blureEffectView)
    }
    
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}
    
    
 


