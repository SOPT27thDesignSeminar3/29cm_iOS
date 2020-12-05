//
//  HomeVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/14.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemData()
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    var homeItems:[HomeItem] = []
    
    func setItemData() {
        homeItems.append(contentsOf: [
       HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "[FW20 ESSENTIAL] 캐시미어 Cashmere Single Coat Wood-brown "),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~"),
            HomeItem(itemImageName: "homeCell3MJ", brandName: "킨더살몬", itemName: "설명~")
                 
                 
        ])
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

extension HomeVC:UICollectionViewDataSource {
    
    //header customize
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return headerView
        default:
            assert(false, "false")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var index = indexPath.item
        
        if index == 0 {
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCVC.identifier, for: indexPath) as? HomeMenuCVC else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemListCVC.identifier, for: indexPath) as? ItemListCVC else {
                return UICollectionViewCell()
            }
            cell.setCell(item: homeItems[indexPath.row])
            return cell
            
        }
        
        
        
    }
    
}

extension HomeVC:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width , height: 48)
        }
        else {
            return CGSize(width: collectionView.frame.width , height: 130)
        }
        
        
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 512
        return CGSize(width: width, height: height)
    }
    
    
}
