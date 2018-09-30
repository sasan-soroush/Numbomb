//
//  MenuViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/29/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController {
    
    let guideText = "Hi \nRecently we've been attacked by a group of hackers they are trying to find the MAIN PASSWORD. \nWe couldn't stop them at all. \nSo we just hope that maybe your ability in preventing cyber attacks helps us. \nWe need you to stop them from testing their passwords in our system. \nLet's do this..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        guideLabelTyping.startTypewritingAnimation {
            self.screenTapped()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screenTapped()
    }
    
    private func screenTapped() {
        guideLabel.isHidden = false
        guideLabelTyping.removeFromSuperview()
        self.startGameButton.isHidden = false
    }
    
    @objc private func startTapped() {
        self.navigationController?.pushViewController(GameViewController(), animated: false)
    }
    
    lazy var guideLabelTyping : TypewriterLabel = {
        let label = TypewriterLabel()
        label.text = guideText
        label.textColor = UIColor.init(rgb: 0x14F208)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.typingTimeInterval = 0.1
        return label
    }()
    
    lazy var guideLabel : UILabel = {
        let label = UILabel()
        label.text = guideText
        label.textColor = UIColor.init(rgb: 0x14F208)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.isHidden = true
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
        view.addSubview(guideLabelTyping)
        
        
        
        guideLabelTyping.frame = CGRect(x: 30, y: 50, width: view.frame.width-60, height: view.frame.height/2)
        guideLabel.frame = guideLabelTyping.frame
        guideLabelTyping.sizeToFit()
        guideLabel.sizeToFit()
        startGameButton.frame = CGRect(x: 80, y: view.frame.height/4*3, width: view.frame.width - 160, height: view.frame.height/12)
        
    }
}









