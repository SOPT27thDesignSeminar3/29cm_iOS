//
//  ProductPriceCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class ProductPriceCVC: UICollectionViewCell {
    static let identifier = "ProductPriceCVC"
    
    @IBOutlet weak var mainBagTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func setMain(){
        if ProductDetailVC.bagcells.count != 0 {
            mainBagTitleLabel.text = ProductDetailVC.bagcells[0].title
            
        }
        
    }
    
    
}
