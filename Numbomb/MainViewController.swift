//
//  ViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/27/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    weak var timer: Timer?
    var words : [UILabel] = []
    var lastWord : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startTimer()
        setupView()
        
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            
            DispatchQueue.main.async {
                self.generateWord()
            }
            
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
    
    
    deinit {
        stopTimer()
    }
    
    private func generateRandomFrame(_ label : UILabel) -> CGRect {
        
        let randomX = arc4random_uniform(UInt32(view.frame.width/4*3))
        
        return CGRect(x: CGFloat(randomX), y: -50 , width: view.frame.width/4, height: 40)
        
    }
    
    private func generateWord() {
        
        let word : UILabel = {
            let label = UILabel()
            label.text = "TEST"
            label.textColor = .red
            label.textAlignment = .center
            return label
        }()
        
        view.addSubview(word)
        word.frame = generateRandomFrame(word)
        self.view.sendSubview(toBack: word)
        
        words.append(word)
        
        animate(word: word)
        
    }
    
    private func animate(word : UILabel) {
        UIView.animate(withDuration: 15) {
            word.frame = CGRect(x: word.frame.minX, y: self.view.frame.height, width: word.frame.width, height: word.frame.height)
        }
    }
    
    private func chooseLastWord() {
        
        let sortedWords = words.sorted{$0.frame.minY < $1.frame.minY}
        
        guard let word = sortedWords.first else {return}
        
        lastWord = word
        
    }
    
    @objc private func removeLetter() {
        
        chooseLastWord()
        
        for word in words {
            if word == lastWord {
                word.textColor = .blue
            }
            word.textColor = .red
        }
        
        guard var lastWordText = lastWord!.text else {return}
        
        if  lastWordText.count == 1 {
            words.remove(at: 0)
            lastWord!.removeFromSuperview()
        } else {
            lastWordText.remove(at: lastWordText.startIndex)
        }
        
        lastWord!.text = lastWordText

    }
    
    let buttonsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(buttonsCollectionView)
        
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
        buttonsCollectionView.register(NumberButtonCollectionViewCell.self, forCellWithReuseIdentifier: "NumberButtonCollectionViewCell")
        
        buttonsCollectionView.frame = CGRect(x: 0 , y: view.frame.height/10*6, width: view.frame.width, height: view.frame.height/10*4)
        
        
        
    }

}





















