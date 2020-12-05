//
//  HomeTBC.swift
//  29cm_iOS
//
//  Created by inae Lee on 2020/12/05.
//

import UIKit

class HomeTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setTabBar() {
        guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeVC") as? UINavigationController else {return}
        guard let weLoveVC = UIStoryboard(name: "WeLove", bundle: nil).instantiateViewController(identifier: "WeLoveVC") as? WeLoveVC else {return}
        
        homeVC.tabBarItem.image = UIImage(named: "navHomeUnselected")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.selectedImage = UIImage(named: "navHomeSelected")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        weLoveVC.tabBarItem.image = UIImage(named: "navWeloveUnselected")?.withRenderingMode(.alwaysOriginal)
        weLoveVC.tabBarItem.selectedImage = UIImage(named: "navWeloveSelected")?.withRenderingMode(.alwaysOriginal)
        weLoveVC.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        
        self.viewControllers = [homeVC, weLoveVC]
    }
}
