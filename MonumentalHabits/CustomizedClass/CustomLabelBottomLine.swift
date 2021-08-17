//
//  CustomLabelBottomLine.swift
//  MonumentalHabits
//
//  Created by Bob on 17.08.21.
//

import UIKit

class CustomLabelBottomLine: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.buttomBorder()
    }
    
    func buttomBorder(){
        //For Shadow
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0

        let sublayer = self.layer;
        sublayer.backgroundColor = UIColor.blue.cgColor
        sublayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1);
        sublayer.borderColor = UIColor.black.cgColor
        sublayer.borderWidth = 1;
        self.layer.insertSublayer(sublayer, at: 0)
    }
}
