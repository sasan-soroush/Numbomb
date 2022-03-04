//
//  Constants.swift
//  Numbomb
//
//  Created by Sasan Soroush on 3/4/22.
//  Copyright © 2022 Sasan Soroush. All rights reserved.
//


/*
 Using case less enum because structs are instantiable and that would be useless
 This will act as a pure namespace
*/

import UIKit

enum Constants {
    enum Colors {
        static let background = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        static let objects = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let selected = #colorLiteral(red: 0.9529411765, green: 0.6117647059, blue: 0.07058823529, alpha: 1)
    }
}
