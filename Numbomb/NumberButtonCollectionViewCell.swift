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
    
    override var isHighlighted: Bool {
        willSet {
            
            let animation = UIViewPropertyAnimator(duration: 0.2, curve: UIViewAnimationCurve.easeInOut) {
                self.backgroundColor = colors.background.rawValue
                self.number.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            DispatchQueue.main.async {
                self.number.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.backgroundColor = colors.selected.rawValue
                DispatchQueue.main.async(execute: {
                    animation.startAnimation()
                })
            }
            
        }
    }
    
    private func animate() {
        
        UIView.animate(withDuration: 0.2, animations: {
            
        })
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
