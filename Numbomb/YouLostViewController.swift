//
//  YouLostViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/29/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class YouLostViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    let lostLabel : UILabel = {
        let label = UILabel()
        label.text = "Game Over"
        label.textColor = UIColor.init(rgb: 0x14F208)
        label.font = UIFont.systemFont(ofSize: 90, weight: UIFont.Weight.bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(lostLabel)
        lostLabel.frame = CGRect(x: 50, y: view.frame.height/2 - 50, width: view.frame.width - 100, height: 100)
    }
}











