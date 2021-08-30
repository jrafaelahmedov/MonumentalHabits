//
//  ColorCellPage.swift
//  MonumentalHabits
//
//  Created by Rafael on 26.08.21.
//

import  UIKit

class ColorCellPage: UICollectionViewCell {
    
    static var identifier: String = "Cell"

         var colorView: UIView!
         var color: UIColor!

                
        
    
        override init(frame: CGRect) {
            super.init(frame: frame)
   
        }
    
        init(color : UIColor) {
            super.init(frame: .zero)
            self.color = color
            colorView = UIView()
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.frame = CGRect(x: 0, y: 0, width: 54, height: 54)
            let borderWidth: CGFloat = 2
//            colorView.frame = colorView.frame.insetBy(dx: -borderWidth, dy: -borderWidth)
            colorView.layer.masksToBounds = true
            colorView.backgroundColor = color
            colorView.layer.cornerRadius = 12
            colorView.layer.borderWidth = borderWidth
            colorView.layer.borderColor = UIColor(ciColor: .black).withAlphaComponent(0.5).cgColor
            
            
            self.contentView.addSubview(colorView)
             NSLayoutConstraint.activate([
                             self.contentView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
                             self.contentView.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
                         ])
            
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func prepareForReuse() {
            super.prepareForReuse()
        }

}

