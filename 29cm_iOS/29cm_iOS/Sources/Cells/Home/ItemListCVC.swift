//
//  ItemListCVC.swift
//  29cm_iOS
//
//  Created by 우민지 on 2020/12/04.
//

import UIKit

class ItemListCVC: UICollectionViewCell {
    static let identifier = "ItemListCVC"
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    func setCell(item: HomeItem) {
        itemImageView.image = item.makeImage()
        brandNameLabel.text = item.brandName
        itemNameLabel.text = item.itemName
    }
    
}
