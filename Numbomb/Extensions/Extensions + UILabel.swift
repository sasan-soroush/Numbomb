//
//  Extensions + UILabel.swift
//  Numbomb
//
//  Created by Sasan Soroush on 3/4/22.
//  Copyright © 2022 Sasan Soroush. All rights reserved.
//

import UIKit

extension UILabel{
    func startBlink() {
        UIView.animate(withDuration: 1,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0 },
                       completion: nil)
    }
    
    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}
