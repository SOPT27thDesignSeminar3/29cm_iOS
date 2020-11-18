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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension WeLoveVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}

extension WeLoveVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            print("cell 0")
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell else { return UICollectionViewCell() }
            
            popularCell.postTitle.text = "단풍이 물드니 아침이 달콤해졌다"
            
            return popularCell
        case 1:
            print("cell 1")
            guard let dailyCell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCell.identifier, for: indexPath) as? DailyCell else { return UICollectionViewCell() }
            
            return dailyCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularHeader.identifier, for: indexPath) as? PopularHeader else { return UICollectionReusableView()}
            
            switch indexPath.section {
            case 0:
                header.headerTitle.text = "Popular Post"
                header.headerBar.isHidden = false
            case 1:
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
