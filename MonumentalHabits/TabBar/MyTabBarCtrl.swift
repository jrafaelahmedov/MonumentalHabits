//
//  TabBar.swift
//  MonumentalHabits
//
//  Created by Rafael on 24.08.21.
//

import UIKit

class MyTabBarCtrl : UITabBarController, UITabBarControllerDelegate {
    
    var button = UIButton(type: .custom)
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

        self.view.bringSubviewToFront(self.tabBar)
            self.addCenterButton()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBarController?.delegate = self

        tabBar.backgroundColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
            let customizator = TabBarCustomizator()
            customizator.myTabBar = tabBar
            customizator.customize()
      
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.unselected_home_icon)?.withRenderingMode(.alwaysOriginal) , selectedImage:  UIImage(named:Utils.home_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        
        let homeController2 = HomeViewController()
        homeController2.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.second_tab_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.second_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
            
        let homeController3 = NewHabitController()
        homeController3.tabBarItem = UITabBarItem(title: .none, image: UIImage(), tag: 2)
    
        
        
        let homeController4 = HomeViewController()
        homeController4.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.third_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.third_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController4.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        
        let homeController5 = HomeViewController()
        homeController5.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.fourd_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.fourt_tab_icon)?.withRenderingMode(.alwaysOriginal))
        
        homeController5.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        let viewControllerList = [ homeController, homeController2,homeController3, homeController4, homeController5 ]
        viewControllers = viewControllerList
        
        self.tabBar.items![2].isEnabled = false
    }
    
    
    private func addCenterButton() {
        button = UIButton(type: .custom)
        changeMiddleButton(status: 0)
        let square = self.tabBar.frame.size.height
        button.frame = CGRect(x: 0, y: 0, width: square, height: square)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = self.tabBar.center


        self.view.addSubview(button)
        self.view.bringSubviewToFront(button)
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -button.frame.height-10).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.addTarget(self, action: #selector(didTouchCenterButton(_:)), for: .touchUpInside)
    }

    @objc
    private func didTouchCenterButton(_ sender: AnyObject) {
        self.selectedIndex = 2
        changeMiddleButton(status: 1)
    }
    
    func changeMiddleButton(status: Int) {
        if (status == 0) {
            button.setImage(#imageLiteral(resourceName: "tab-middle"), for: .normal )
        } else {
            button.setImage(#imageLiteral(resourceName: "check"), for: .normal )
        }
    }
    
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if self.selectedIndex == 0 {
//            button.setImage(#imageLiteral(resourceName: "tab-middle"), for: .normal )
//        }
//    }
//
//
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//
//           let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
//           if selectedIndex == 0 {
//               print("first tab bar was selected")
//           } else {
//               //do whatever
//           }
//       }

}
