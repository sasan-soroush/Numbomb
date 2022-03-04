//
//  GameViewController + Extensions.swift
//  Numbomb
//
//  Created by Sasan Soroush on 3/4/22.
//  Copyright © 2022 Sasan Soroush. All rights reserved.
//

import UIKit

extension GameViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberButtonCollectionViewCell", for: indexPath) as! NumberButtonCollectionViewCell
        
        
        let margin : CGFloat = 3.5
        cell.number.frame = CGRect(x: margin, y: margin, width: cell.frame.width - margin*2, height: cell.frame.height - margin*2)
        
        switch indexPath.item {
        case 9:
            cell.number.text = "0"
        default:
            cell.number.text = "\(indexPath.item + 1)"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 9:
            return CGSize(width: view!.frame.width, height: view!.frame.height/10)
        default:
            return CGSize(width: view!.frame.width/3, height: view!.frame.height/10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.item {
        case 9:
            removeLetter(character: "0")
        default:
            removeLetter(character: "\(indexPath.item+1)")
        }
        
    }
}
