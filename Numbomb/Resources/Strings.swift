//
//  Strings.swift
//  Numbomb
//
//  Created by Sasan Soroush on 3/4/22.
//  Copyright © 2022 Sasan Soroush. All rights reserved.
//

import UIKit

enum Strings : String {
    case game_introduction
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
