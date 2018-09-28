//
//  ButtonsCollectionView.swift
//  Numbomb
//
//  Created by Sasan Soroush on 9/28/18.
//  Copyright © 2018 Sasan Soroush. All rights reserved.
//

import UIKit

extension GameViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberButtonCollectionViewCell", for: indexPath) as! NumberButtonCollectionViewCell
        
        cell.number.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        
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
        return 0
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













