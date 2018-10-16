//
//  ViewController.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/27/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit
import LTMorphingLabel
import AudioToolbox

class GameViewController: UIViewController , LTMorphingLabelDelegate{

    weak var timer: Timer?
    weak var updateTimer : Timer?
    weak var durationTimer : Timer?
    weak var numberRangeTime : Timer?
    
    var words : [LTMorphingLabel] = []
    var lastWord : LTMorphingLabel?
    var lastWordHeight : CGFloat?
    var duration : Double = 10.0
    var rangeOfRandomNumber = 901
    var startNumberForRange = 100
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        setupView()
        setDuration()
        setNumberRange()
        update()
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        killAllAnimations()
        
    }
    
    private func killAllAnimations() {
        self.view.subviews.forEach({$0.layer.removeAllAnimations()})
        self.view.layer.removeAllAnimations()
        self.view.layoutIfNeeded()
        timer?.invalidate()
        updateTimer?.invalidate()
        durationTimer?.invalidate()
        numberRangeTime?.invalidate()
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            
            DispatchQueue.main.async {
                self.generateWord()
            }
            
        }
    }
    
    
    
    private func update() {
        updateTimer?.invalidate()
        updateTimer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true, block: { (_) in
            
            guard let lastWord = self.words.first else {return}
            if let pos = lastWord.layer.presentation()?.frame.maxY {
                if pos >= self.buttonsCollectionView.frame.minY+40 {
                    
                    self.gameOver()
                    
                }
            }
            
            
        })
    }
    
    private func gameOver() {
        saveHighScore()
        self.words.remove(at: 0)
        self.words.first?.removeFromSuperview()
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.navigationController?.pushViewController(YouLostViewController(), animated: true)
    }
    
    private func saveHighScore() {
       
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(score, forKey: "highscore")
        userDefaults.synchronize()
        
    }
    
    private func setDuration () {
        durationTimer?.invalidate()
        durationTimer = Timer.scheduledTimer(withTimeInterval: 20, repeats: true, block: { (_) in
        
            self.changeBackground()
            print("Increasing the speed")
            let x = self.duration * 0.9
            let y = Double(round(x * 100)/100)
            self.duration = y
            //TODO:- set minimum speed
            
        })
    }
    
    private func setNumberRange() {
        numberRangeTime?.invalidate()
        numberRangeTime = Timer.scheduledTimer(withTimeInterval: 20, repeats: true, block: { (_) in
            
            self.rangeOfRandomNumber *= 10
            self.startNumberForRange *= 10
            
        })
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
    
    
    deinit {
        stopTimer()
    }
    
    private func generateRandomFrame(_ label : UILabel) -> CGRect {
        
        let randomX = arc4random_uniform(UInt32(view.frame.width/4*2))
        
        return CGRect(x: CGFloat(randomX), y: -100 , width: view.frame.width/2, height: 100)
        
    }
    
    private func changeBackground() {
        var index = 0
        let colors : [UIColor] = [UIColor.red , UIColor.blue , UIColor.green]
        
        let animation = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.easeInOut) {
            self.view.backgroundColor = colors[index]
            
            if index == colors.count-1 {
                index = 0
            } else {
                index += 1
            }
            
        }
        
        animation.startAnimation()
        
        
        
    }
    
    private func generateWord() {
        
        let word : LTMorphingLabel = {
            let label = LTMorphingLabel()
            label.text = getRandomWord()
            label.textColor = colors.objects.rawValue
            label.textAlignment = .center
            label.morphingEffect = LTMorphingEffect.evaporate
            label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.heavy)
            return label
        }()
        
        view.addSubview(word)
        word.frame = generateRandomFrame(word)
        self.view.sendSubview(toBack: word)
        
        words.append(word)
        
        animate(word: word, duration: duration)
        
    }
    
    private func getRandomWord() -> String{
        
        let randomNumber = arc4random_uniform(UInt32(rangeOfRandomNumber)) + UInt32(startNumberForRange)
       
        return String(randomNumber)
        
    }
    
    private func animate(word : UILabel , duration : Double) {
        
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
             word.frame = CGRect(x: word.frame.minX, y: self.view.frame.height, width: word.frame.width, height: word.frame.height)
        }, completion: nil)

    }
    
    private func chooseLastWord() {
        
        let sortedWords = words.sorted{$0.frame.minY < $1.frame.minY}
        
        guard let word = sortedWords.first else {return}
        
        lastWord = word
        
    }
    
    func removeLetter(character : String) {
        
        if words.count > 0 {
           
            chooseLastWord()
            
            words.first?.textColor = colors.selected.rawValue
            
            guard var lastWordText = words.first?.text else {return}
            guard let firstWord = words.first else {return}
            guard let firstWordText = firstWord.text else {return}
            guard let firstCharacte = firstWordText.first else {return}
            
            if String(firstCharacte) == character {
                
                if  lastWordText.count == 1 {
                    
                    lastWordText.remove(at: lastWordText.startIndex)
                    deleteionAnimation()
                    
                } else {
                    
                    lastWordText.remove(at: lastWordText.startIndex)
                    
                }
                
            }
            
            lastWord!.text = lastWordText
        }
        
    }
    
    let buttonsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = colors.background.rawValue
        return view
    }()
    
    private func deleteionAnimation() {
        
        score += 1
        self.scoreLabel.text = "\(score)"
        let lastWord = words.first
        
        if words.count > 0 {
            self.words.remove(at: 0)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            
            lastWord!.alpha = 0
            
        }) { (_) in
            
            if self.words.count > 0 {
                lastWord!.removeFromSuperview()
            }
            
            
            
        }
        
    }
    
    let scoreLabel : LTMorphingLabel = {
        let label = LTMorphingLabel()
        label.textColor = colors.objects.rawValue
        label.adjustsFontSizeToFitWidth = true
        label.morphingEffect = LTMorphingEffect.evaporate
        label.textAlignment = .center
        return label
    }()
    
    private func setupView() {
        
        view.backgroundColor = colors.background.rawValue
        
        view.addSubview(buttonsCollectionView)
        view.addSubview(scoreLabel)
        
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
        buttonsCollectionView.register(NumberButtonCollectionViewCell.self, forCellWithReuseIdentifier: "NumberButtonCollectionViewCell")
        
        buttonsCollectionView.frame = CGRect(x: 0 , y: view.frame.height/10*6, width: view.frame.width, height: view.frame.height/10*4)
        
        scoreLabel.frame = CGRect(x: 0, y: buttonsCollectionView.frame.minY - 60, width: view.frame.width, height: 80)
        scoreLabel.text = "\(self.score)"
        buttonsCollectionView.contentInsetAdjustmentBehavior = .never
        
    }

}





















