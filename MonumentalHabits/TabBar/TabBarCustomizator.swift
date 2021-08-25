//
//  CustomizedTabBar.swift
//  CustomizedTabBar
//
//  Created by Ace on 19.10.2019.
//  Copyright © 2019 Ace. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class TabBarCustomizator {
    
    // MARK: - Properties
    var myTabBar: UITabBar!
    private let bumpHeight: CGFloat = 16
    private let shapeLayer = CAShapeLayer()
    private let darkColor: UIColor = .white
    private let lightColor: UIColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    private let redButton = UIView()
    private let redButtonRadius: CGFloat = 29
    private let imgRedButtonIcon = UIImageView(image: UIImage(named: Utils.tabMiddleButton))
    var isRedButtonMovedUp = false
    
    // MARK: - Methods
    func customize() {
        addShape()
//        setupMiddleButton()
//        createRedButton()
        
    }
    
    private func addShape() {
        shapeLayer.path = createPath()
        shapeLayer.fillColor = darkColor.cgColor
        shapeLayer.shadowColor = UIColor.white.cgColor
        shapeLayer.shadowRadius = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowOpacity = 1
        
        myTabBar.layer.insertSublayer(shapeLayer, at: 0)
        
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 30.0
        let path = UIBezierPath()
        let centerWidth = myTabBar.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough

        path.addCurve(to: CGPoint(x: centerWidth, y: height),
        controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height))

        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
        controlPoint1: CGPoint(x: centerWidth + 35, y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))

        path.addLine(to: CGPoint(x: myTabBar.frame.width*2, y: 0))
        path.addLine(to: CGPoint(x: myTabBar.frame.width*2, y: myTabBar.frame.height*2))
        path.addLine(to: CGPoint(x: 0, y: myTabBar.frame.height*2))
        path.close()
        return path.cgPath
    }
    
//    private func createRedButton() {
//        let tabBarHeight = UIScreen.main.bounds.size.height - tabBar.frame.minY
////
//        imgRedButtonIcon.center = CGPoint(x: tabBar.frame.midX, y: -tabBarHeight + bumpHeight + 20)
////
////        let circle = CAShapeLayer()
////        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2 * redButtonRadius, height: 2 * redButtonRadius), cornerRadius: redButtonRadius).cgPath
////        circle.fillColor = UIColor.red.cgColor
////        circle.position = CGPoint(x: imgRedButtonIcon.center.x - redButtonRadius, y: imgRedButtonIcon.center.y - 50 - redButtonRadius)
////        circle.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
////        circle.shadowRadius = 5
////        circle.shadowOffset = .zero
////        circle.shadowOpacity = 1
//
//        redButton.tintColor = .white
////        redButton.layer.addSublayer(circle)
//        redButton.isUserInteractionEnabled = true
//        redButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMiddleButton)))
//        redButton.addSubview(imgRedButtonIcon)
//        tabBar.addSubview(redButton)
//
//        tabBar.bringSubviewToFront(redButton)
//
//        redButton.isUserInteractionEnabled = true
//        redButton.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(click)))
//    }
    
//    func setupMiddleButton() {
//            let middleBtn = UIButton(frame: CGRect(x: (myTabBar.bounds.width / 2)-40, y: -50, width: 80, height: 80))
//            middleBtn.setImage(#imageLiteral(resourceName: "tab-middle"), for: .normal )
//            myTabBar.addSubview(middleBtn)
//            middleBtn.isUserInteractionEnabled = true
//            middleBtn.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
//            myTabBar.bringSubviewToFront(middleBtn)
//            myTabBar.layoutIfNeeded()
//        let view = myTabBar.hitTest(CGPoint(x: myTabBar.frame.width, y: myTabBar.frame.height), with: .none)
//
//        view?.backgroundColor = .red
//        }
//
//        // Menu Button Touch Action
//        @objc func menuButtonAction(sender: UIButton) {
//           print("test")   //to select the middle tab. use "1" if you have only 3 tabs.
//        }
    
    @objc func click(){
        print("test")
    }

    
    @objc func handleMiddleButton() {
        print("dfsf")
    }
    
//    func moveButton() {
//        UIView.animate(withDuration: 0.5,
//                       delay: 0.0,
//                       options: [],
//                       animations: { [weak self] in
//                        guard let self = self else { return }
//                        if self.isRedButtonMovedUp {
//                            self.redButton.center.y += self.redButtonRadius * 0.2
//                            self.isRedButtonMovedUp.toggle()
//                        } else {
//                            self.redButton.center.y -= self.redButtonRadius * 0.2
//                            self.isRedButtonMovedUp.toggle()
//                        }
//                        self.redButton.tintColor = self.isRedButtonMovedUp ? .white : .systemYellow },
//                       completion: { _ in
//                        self.changeRedButtonIcon() }
//        )
//    }
//
//    private func changeRedButtonIcon() {
//
//        if isRedButtonMovedUp {
//            imgRedButtonIcon.image = UIImage(named: Utils.tabMiddleButton)
//        } else {
//            imgRedButtonIcon.image = UIImage(named: Utils.tabMiddleButton)
//        }
//    }

    
    func toggleTabBarStyle() {
        shapeLayer.fillColor = isRedButtonMovedUp ? lightColor.cgColor : darkColor.cgColor
    }
  
    
}
