//
//  RelatedCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class RelatedCVC: UICollectionViewCell {
    
    static let identifier = "RelatedCVC"
    @IBOutlet weak var productImageCV: UICollectionView!
    
    var images = ["bestProductImg1","bestProductImg2","bestProductImg3"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageCV.delegate = self
        productImageCV.dataSource = self
    }
    
    
    
    
    
}


extension RelatedCVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}

extension RelatedCVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RelatedProductsCVC.identifier,
                for: indexPath) as? RelatedProductsCVC else {
            
            return UICollectionViewCell()}
        
        
        cell.setImage(imgName: images[indexPath.item])
        
        return cell
    }
    
    
    
    
}

extension RelatedCVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 123 , height: 123)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    //    UIEdgeInset
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    

    
}
