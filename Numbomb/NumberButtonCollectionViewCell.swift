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
        label.backgroundColor = colors.objects.rawValue
        label.textColor = colors.background.rawValue
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        return label
    }()
    
    private func setupView() {
       
        clipsToBounds = true
        
        addSubview(number)
        
        backgroundColor = colors.background.rawValue
        
    }
    
}
