//
//  MenuViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/29/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

extension IntroViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setup()
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
    
    private func setup() {
        let text = Strings.game_introduction.localized
        guideLabel.text = text
        guideLabelTyping.text = text
        guideLabelTyping.startTypewritingAnimation {
            self.screenTapped()
        }
    }
    
    @objc private func startTapped() {
        self.navigationController?.pushViewController(GameViewController(), animated: false)
    }
}

class IntroViewController : BaseViewController {
    let guideLabelTyping : TypewriterLabel = {
        let label = TypewriterLabel()
        label.textColor = Constants.Colors.objects
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.typingTimeInterval = 0.1
        return label
    }()
    
    let guideLabel : UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.objects
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.isHidden = true
        return label
    }()
    
    let startGameButton : UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor( Constants.Colors.objects, for: .normal)
        button.layer.borderColor = Constants.Colors.objects.cgColor
        button.layer.borderWidth = 2.5
        button.layer.cornerRadius = 8
        button.isHidden = true
        button.addTarget(self, action: #selector(startTapped), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = Constants.Colors.background
        view.addSubview(guideLabel)
        view.addSubview(startGameButton)
        view.addSubview(guideLabelTyping)
        
        guideLabelTyping.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        startGameButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.height.equalToSuperview().dividedBy(12)
        }
        
        guideLabelTyping.sizeToFit()
        guideLabel.sizeToFit()
    }
}









