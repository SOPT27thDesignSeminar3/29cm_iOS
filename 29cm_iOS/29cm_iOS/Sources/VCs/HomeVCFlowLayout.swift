//
//  HomeVCFlowLayout.swift
//  29cm_iOS
//
//  Created by 우민지 on 2020/12/04.
//

import Foundation
import UIKit

class HomeVCFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        guard let offset = collectionView?.contentOffset,
              let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
        }
        
        if offset.y < 0 {
            for attributes in stLayoutAttributes {
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    let diifValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, 512 + diifValue)
                    frame.origin.y = frame.minY - diifValue
                    attributes.frame = frame
                    
                }
            }
        }
        
        else {
            for attributes in stLayoutAttributes {
                
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    
                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, 512 - diffValue)
                    frame.origin.y = frame.minY + diffValue
                    attributes.frame = frame
                    
                    attributes.alpha = 1 - diffValue/512
                    
                }
                
            }
        }
        
        return layoutAttributes
    }
    
    
}
