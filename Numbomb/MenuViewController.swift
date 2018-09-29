//
//  MenuViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/29/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        guideLabel.startTypewritingAnimation {
            self.makeButtonVisible()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        makeButtonVisible()
    }
    
    private func makeButtonVisible() {
        
        self.startGameButton.isHidden = false
    }
    
    @objc private func startTapped() {
        self.navigationController?.pushViewController(GameViewController(), animated: false)
    }
    
    let guideLabel : TypewriterLabel = {
        let label = TypewriterLabel()
        label.text = " _ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla eu ligula non tristique. Praesent finibus mattis purus ac suscipit. Donec laoreet ligula odio, sit amet porta felis scelerisque at."
        label.textColor = UIColor.init(rgb: 0x14F208)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.typingTimeInterval = 0.1
        return label
    }()
    
    let startGameButton : UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor( UIColor.init(rgb: 0x14F208), for: .normal)
        button.layer.borderColor = UIColor.init(rgb: 0x14F208).cgColor
        button.layer.borderWidth = 2.5
        button.layer.cornerRadius = 8
        button.isHidden = true
        button.addTarget(self, action: #selector(startTapped), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(guideLabel)
        view.addSubview(startGameButton)
        
        guideLabel.frame = CGRect(x: 30, y: 30, width: view.frame.width-60, height: view.frame.height/2)
        
        guideLabel.sizeToFit()
        
        startGameButton.frame = CGRect(x: 80, y: view.frame.height/4*3, width: view.frame.width - 160, height: view.frame.height/12)
        
    }
}









