//
//  HomeItem.swift
//  29cm_iOS
//
//  Created by 우민지 on 2020/12/04.
//

import Foundation
import UIKit

struct HomeItem {
    
    var itemImageName:String
    var brandName:String
    var itemName:String
    
    func makeImage() -> UIImage? {
        return UIImage(named: itemImageName)
        
    }
}
