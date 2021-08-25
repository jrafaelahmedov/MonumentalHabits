//
//  TabBar.swift
//  MonumentalHabits
//
//  Created by Rafael on 24.08.21.
//

import UIKit

class MyTabBarCtrl : UITabBarController, UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

        self.view.bringSubviewToFront(self.tabBar)
            self.addCenterButton()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
//        let bottomView: UIView = {
//            let view = UIView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.backgroundColor = .white
//            return view
//        }()
//
//        view.addSubview(bottomView)
//
//        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        bottomView.heightAnchor.constraint(equalToConstant: 35).isActive = true
//
        tabBar.backgroundColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    
//
        if #available(iOS 13.0, *) {
            let customizator = TabBarCustomizator()
            customizator.myTabBar = tabBar
            customizator.customize()
        } else {
            // Fallback on earlier versions
        }
        
        
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.unselected_home_icon)?.withRenderingMode(.alwaysOriginal) , selectedImage:  UIImage(named:Utils.home_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        
        
        let homeController2 = HomeViewController()
        homeController2.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.second_tab_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.second_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        
        
        let homeController3 = HomeViewController()
        homeController3.tabBarItem = UITabBarItem(title: .none, image: UIImage(), tag: 2)
        
//        let homeController3 = HomeViewController()
//        homeController3.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
        let homeController4 = HomeViewController()
        homeController4.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.third_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.third_tab_icon)?.withRenderingMode(.alwaysOriginal))
        homeController4.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        let homeController5 = HomeViewController()
        homeController5.tabBarItem = UITabBarItem(title: .none, image: UIImage(named:Utils.fourd_unselected)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:Utils.fourt_tab_icon)?.withRenderingMode(.alwaysOriginal))
        
        homeController5.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        let viewControllerList = [ homeController, homeController2,homeController3, homeController4, homeController5 ]
        viewControllers = viewControllerList
    }
    
    
    private func addCenterButton() {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "tab-middle"), for: .normal )
//        button.setTitle("SALAM", for: .normal)
        let square = self.tabBar.frame.size.height
        button.frame = CGRect(x: 0, y: 0, width: square, height: square)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = self.tabBar.center
        
//        button.backgroundColor = .red

        self.view.addSubview(button)
        self.view.bringSubviewToFront(button)
        
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        button.addTarget(self, action: #selector(didTouchCenterButton(_:)), for: .touchUpInside)
    }

    @objc
    private func didTouchCenterButton(_ sender: AnyObject) {
        print("!!")
    }
    

}