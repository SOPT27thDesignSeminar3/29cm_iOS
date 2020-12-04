//
//  WeLoveVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/14.
//

import UIKit

class WeLoveVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension WeLoveVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 450)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 380)
        default:
            return CGSize(width: collectionView.frame.width, height: 150)
        }
    }
    
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 0) {
            return CGSize.zero
        } else {
            return CGSize(width: collectionView.frame.width, height: 60) //refact
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

extension WeLoveVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {return UICollectionViewCell() }
            
            return bannerCell
        case 1:
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell else { return UICollectionViewCell() }
            
            popularCell.postTitle.text = "단풍이 물드니 아침이 \n달콤해졌다"
            popularCell.postTitle.numberOfLines = 0
            popularCell.postTitle.sizeToFit()
            
            popularCell.postImage.image = UIImage(named: "imgPopularPost")
            
            popularCell.postDescription.text = "[집에서 즐기는 치즈] 조장현 셰프 북토크"
            popularCell.postDate.text = "2020.11.08"
            
            return popularCell
        case 2:
            guard let dailyCell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCell.identifier, for: indexPath) as? DailyCell else { return UICollectionViewCell() }
            
            dailyCell.postImage.image = UIImage(named: "rectangle31")
            dailyCell.postTitle.numberOfLines = 0
            dailyCell.postTitle.text = "일러스트레이터 윤예지의 \n추천 아이템"
            dailyCell.postDescription.text = "쿠션감이 있는 런닝화가 필요하다면?"
            dailyCell.postDate.text = "2020.11.19"
            return dailyCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularHeader.identifier, for: indexPath) as? PopularHeader else { return UICollectionReusableView()}
            
            switch indexPath.section {
            case 0: break
            case 1:
                header.headerTitle.text = "Popular Post"
                header.headerBar.isHidden = false
            case 2:
                header.headerTitle.text = "Daily Post"
                header.headerBar.isHidden = true
            default:
                return UICollectionReusableView()
            }
            
            return header
        }
        
        return UICollectionReusableView()
    }
}
