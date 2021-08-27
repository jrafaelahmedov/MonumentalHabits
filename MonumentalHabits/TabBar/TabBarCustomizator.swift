//
//  CustomizedTabBar.swift
//  CustomizedTabBar
//
//  Created by Ace on 19.10.2019.
//  Copyright © 2019 Ace. All rights reserved.
//

import UIKit

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

    
    func toggleTabBarStyle() {
        shapeLayer.fillColor = isRedButtonMovedUp ? lightColor.cgColor : darkColor.cgColor
    }
  
    
}
