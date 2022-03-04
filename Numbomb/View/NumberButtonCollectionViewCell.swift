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
            let animation = UIViewPropertyAnimator(duration: 0.2, curve: UIView.AnimationCurve.easeInOut) {
                self.backgroundColor = Constants.Colors.background
                self.number.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            DispatchQueue.main.async {
                self.number.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.backgroundColor = Constants.Colors.selected
                DispatchQueue.main.async(execute: {
                    animation.startAnimation()
                })
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let number : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = Constants.Colors.objects
        label.textColor = Constants.Colors.background
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        return label
    }()
    
    private func setupView() {
        clipsToBounds = true
        addSubview(number)
        backgroundColor = Constants.Colors.background
    }
    
}
