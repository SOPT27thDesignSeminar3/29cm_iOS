//
//  PostCell.swift
//  29cm_iOS
//
//  Created by inae Lee on 2020/11/17.
//

import UIKit

class PopularCell: UICollectionViewCell {
    static let identifier = "PopularCell"
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postDate: UILabel!
}
