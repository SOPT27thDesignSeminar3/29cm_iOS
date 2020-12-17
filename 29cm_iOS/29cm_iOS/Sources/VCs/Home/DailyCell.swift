//
//  DailyCell.swift
//  29cm_iOS
//
//  Created by inae Lee on 2020/11/18.
//

import UIKit
import Kingfisher

class DailyCell: UICollectionViewCell {
    static let identifier = "DailyCell"
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postDate: UILabel!
}

extension DailyCell {
    func setCell(post: DailyPostData) {
        postTitle.text = post.title
        postDescription.text = post.desc
        postDate.text = post.date
        postImage.kf.setImage(with: URL(string: post.image))
    }
}
