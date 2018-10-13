//
//  Colors.swift
//  Numbomb
//
//  Created by New User on 10/13/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

enum colors {
    case background , objects , selected
    
    var rawValue: UIColor {
        get {
            
            switch self {
            case .background:
                return UIColor.init(rgb: 0x2c3e50)
            case .selected :
                return UIColor.init(rgb: 0xf39c12)
            case .objects :
                return UIColor.white
            }
            
        }
    }
}
