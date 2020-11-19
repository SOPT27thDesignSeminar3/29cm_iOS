//
//  PopluarPostYJCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class PopluarPostYJCVC: UICollectionViewCell {
    static let identifier = "PopluarPostYJCVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var popularImgView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var labelImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        popularImgView.image = UIImage(named: "imgPopularPost")
        titleLabel.text = "단풍이 물드니 아침이\n달콤해졌다"
        detailLabel.text = "[집에서 즐기는 치즈] 조장현 셰프 북토크"
        dateLabel.text = "2020.11.07"
        labelImageView.image = UIImage(named: "hashtagYJ3")
      
    }
    
    
}
