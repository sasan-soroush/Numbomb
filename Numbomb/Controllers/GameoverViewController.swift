//
//  YouLostViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/29/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class GameoverViewController : BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        getHighScore()
        
    }
    
    @objc private func buttonTapped(button : UIButton) {
        switch button.tag {
        case 1:
            self.navigationController?.popToRootViewController(animated: true)
            break
        case 2:
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.pushViewController(GameViewController(), animated: false)
            break
        default:
            break
        }
    }
    
    private func getHighScore() {
        let userDefaults = UserDefaults.standard
        if let highscore = userDefaults.value(forKey: "highscore") {
            self.scoreLabel.text = "\(highscore)"
        }
        else {
            self.scoreLabel.text = "Nice"
        }
    }
    
    let lostLabel : UILabel = {
        let label = UILabel()
        label.text = "Game Over"
        label.textColor = Constants.Colors.objects
        label.font = UIFont.systemFont(ofSize: 90, weight: UIFont.Weight.bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let homeButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "home").withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: UIControl.State.normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        button.tintColor = Constants.Colors.objects
        return button
    }()
    
    let repeatButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "repeat").withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: UIControl.State.normal)
        button.tag = 2
        button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        button.tintColor = Constants.Colors.objects
        return button
    }()
    
    let scoreLabel : UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.selected
        label.font = UIFont.systemFont(ofSize: 70, weight: UIFont.Weight.bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private func setupView() {
        view.backgroundColor = Constants.Colors.background
        view.addSubview(lostLabel)
        view.addSubview(homeButton)
        view.addSubview(repeatButton)
        view.addSubview(scoreLabel)
        
        let size = CGFloat(50)
        
        lostLabel.frame = CGRect(x: 50, y: view.frame.height/2 - 50, width: view.frame.width - 100, height: 100)
        
        homeButton.frame = CGRect(x: view.frame.width/2 - 80, y: (view.frame.height - lostLabel.frame.maxY - 60)/2 + lostLabel.frame.maxY, width: size, height: size)
        
        repeatButton.frame = CGRect(x: view.frame.width/2 + 20, y: (view.frame.height - lostLabel.frame.maxY - 60)/2 + lostLabel.frame.maxY, width: size, height: size)
        
        scoreLabel.frame = CGRect(x: 80, y: 0, width: view.frame.width-160, height: lostLabel.frame.minY)
    }
}











