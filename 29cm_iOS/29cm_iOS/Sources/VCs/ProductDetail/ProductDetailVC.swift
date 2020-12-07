//
//  ProductDetailVC.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/11/14.
//

import UIKit
import Kingfisher

class ProductDetailVC: UIViewController {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var wholeCollectionView: UICollectionView!
    
    
    let headerImage = UIImageView()
    var url = ""
    static var bagcells : [BagCategoryData] = []
    

    
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        wholeCollectionView.delegate = self
        wholeCollectionView.dataSource = self
        getBagInfo()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //MARK: - User Define Functions
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    
    func getBagInfo(){
        BagCategoryService.shared.getInfo() {networkResult -> Void in
            switch networkResult {
            case .success(let data) :
                if let bags = data as? [BagCategoryData] {
                    self.url = bags[0].mainImage
                    
                    for bag in bags{
                        ProductDetailVC.bagcells.append(bag)
                    }
                    
                    self.wholeCollectionView.reloadData()
                    print(self.url)
                    
                }
            case .requestErr(let msg) :
                print(msg)
                
            case .pathErr :
                print("path")
            case .serverErr :
                print("server")
            case .networkFail :
                print("networkFail;;;;")
            
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
    
}


extension ProductDetailVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0{
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProductPriceCVC.identifier,
                    for: indexPath) as? ProductPriceCVC else {
                
                return UICollectionViewCell()}
            
            cell.setMain()
            
            return cell
            
        }
        else{
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RelatedCVC.identifier,
                    for: indexPath) as? RelatedCVC else {
                
                return UICollectionViewCell()}
            
            
            return cell
            
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableViewPD", for: indexPath)
            
            headerView.addSubview(headerImage)
            headerImage.kf.setImage(with : URL(string: url))
            if let superview = headerImage.superview {

                headerImage.translatesAutoresizingMaskIntoConstraints = false
                
                headerImage.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
                headerImage.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
                headerImage.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
                headerImage.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true

            }
            
            
            
            return headerView
        default:
            assert(false,"")
            
        }
        
        
    }
    
    
}

extension ProductDetailVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    
    
    
    
    
}

extension ProductDetailVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0{
            return CGSize(width: collectionView.frame.width , height: 162)
        }
        else{
            return CGSize(width: collectionView.frame.width , height: 195)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //    UIEdgeInset
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 420
        return CGSize(width: width, height: height)
    }
 
    
}
