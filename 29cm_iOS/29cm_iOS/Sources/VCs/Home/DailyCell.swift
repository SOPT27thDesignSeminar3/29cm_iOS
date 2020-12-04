//
//  DailyCell.swift
//  29cm_iOS
//
//  Created by inae Lee on 2020/11/18.
//

import UIKit

class DailyCell: UICollectionViewCell {
    static let identifier = "DailyCell"
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postDate: UILabel!
}
