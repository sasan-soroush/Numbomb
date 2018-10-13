//
//  NumberButtonCollectionViewCell.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/28/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class NumberButtonCollectionViewCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let number : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = colors.background.rawValue
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        return label
    }()
    
    private func setupView() {
       
        backgroundColor = colors.objects.rawValue
        layer.borderColor = colors.background.rawValue.cgColor
        layer.borderWidth = 5
//        layer.cornerRadius = 8.5
        clipsToBounds = true
        
        addSubview(number)
        
    }
    
}
