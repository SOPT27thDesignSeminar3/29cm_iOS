//
//  DailyPostYJCVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/19.
//

import UIKit

class DailyPostYJCVC: UICollectionViewCell {
    
    static let identifier = "DailyPostYJCVC"
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    @IBOutlet var labelImages: [UIImageView]!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.image = UIImage(named: "rectangle31")
        titleLabel.text = "일러스트레이터 윤예지의 추천\n아이템"
        detailLabel.text = "쿠션감이 있는 런닝화가 필요하다면?"
        dateLabel.text = "2020.11.10"
        labelImages[0].image = UIImage(named: "hashtagYJ1")
        labelImages[1].image = UIImage(named: "hashtagYJ2")
        
        
    }
    
    func setImems(){
        
        
        
    }
    
}
