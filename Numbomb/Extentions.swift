//
//  Extentions.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/27/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

extension String {
    var stringWidth: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.width
    }
    
    var stringHeight: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.height
    }
}
