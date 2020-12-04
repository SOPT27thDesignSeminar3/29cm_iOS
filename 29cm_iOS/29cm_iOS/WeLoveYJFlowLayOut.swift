//
//  WeLoveYJFlowLayOut.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class WeLoveYJFlowLayOut: UICollectionViewFlowLayout {
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }


    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
        }
        if offset.y < 0 {

            for attributes in stLayoutAttributes {

                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {

                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, 480 + diffValue)
                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                   
                }
            }
        }
        
        else {
            
            for attributes in stLayoutAttributes {

                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {

                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, 480 - diffValue)
                    frame.origin.y = frame.minY + diffValue
                    attributes.frame = frame
                   
                    
                    attributes.alpha =  1 - diffValue/480
                }
            }
            
            
            if offset.y > 480 {
//                collectionView?.isScrollEnabled = false
                
                
            }
            
            
        }
        return layoutAttributes
    }

}
