//
//  RelatedProductsCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit
import Kingfisher

class RelatedProductsCVC: UICollectionViewCell {
    
    static let identifier = "RelatedProductsCVC"
    
    @IBOutlet weak var productImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setImage(imgName : String){
        self.productImage.kf.setImage(with : URL(string: imgName))

    }
    
    
    
    
}
