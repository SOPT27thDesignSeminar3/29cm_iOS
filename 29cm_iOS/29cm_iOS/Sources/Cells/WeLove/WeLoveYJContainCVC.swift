//
//  WeLoveYJContainCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class WeLoveYJContainCVC: UICollectionViewCell {
    static let identifier = "WeLoveYJContainCVC"
    
    @IBOutlet weak var ContentsCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentsCV.delegate = self
        ContentsCV.dataSource = self
        
        
    }
    
    
    
}


extension WeLoveYJContainCVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}

extension WeLoveYJContainCVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item <= 1{
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PopluarPostYJCVC.identifier,
                    for: indexPath) as? PopluarPostYJCVC else {
                
                return UICollectionViewCell()}
            
            
            return cell
            
        }
        else{
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: DailyPostYJCVC.identifier,
                    for: indexPath) as? DailyPostYJCVC else {
                
                return UICollectionViewCell()}
            
            
            return cell
            
            
        }
    }
    
    
    
    
}

extension WeLoveYJContainCVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item <= 1 {
            return CGSize(width: collectionView.frame.width , height: 204)
        }
        else{
            return CGSize(width: collectionView.frame.width , height: 408)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //    UIEdgeInset
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    

    
}
