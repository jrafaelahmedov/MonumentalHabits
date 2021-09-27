//
//  ColorCellPage.swift
//  MonumentalHabits
//
//  Created by Rafael on 26.08.21.
//

import  UIKit

class ColorCellPage: UICollectionViewCell {
    
    
    
    static var identifier: String = "Cell"
    var half: Bool = true

    var colorView: UIImageView! = UIImageView()
    
    
    
         var color: UIColor!{
             didSet {
                colorView.translatesAutoresizingMaskIntoConstraints = false
                colorView.layer.masksToBounds = true
                colorView.layer.cornerRadius = 0
//                colorView.image = #imageLiteral(resourceName: "half_color")
                
//                colorView.tintColor = color
                
                self.contentView.addSubview(colorView)
                
                if half {
                    
                    colorView.image = #imageLiteral(resourceName: "half_color")
                    colorView.image = colorView.image?.withRenderingMode(.alwaysTemplate)
                    colorView.tintColor = color
                    
                 NSLayoutConstraint.activate([
                    self.colorView.widthAnchor.constraint(equalToConstant: 42),
                    self.colorView.heightAnchor.constraint(equalToConstant: 42),
                    self.colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                    self.colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
                    self.colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
                    self.colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
//                                 self.contentView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
//                                 self.contentView.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
                 ])
                } else {
                    colorView.image = #imageLiteral(resourceName: "full_image_item")
                    colorView.image = colorView.image?.withRenderingMode(.alwaysTemplate)
                    colorView.tintColor = color
                    
                    NSLayoutConstraint.activate([
                    self.colorView.widthAnchor.constraint(equalToConstant: 42),
                    self.colorView.heightAnchor.constraint(equalToConstant: 42),
                    self.colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
                    self.colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
                    self.colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
                    self.colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
                    ])
                }
             }
         }
                
        
    
        override init(frame: CGRect) {
            super.init(frame: frame)
   
        }
    
        init(color : UIColor) {
            super.init(frame: .zero)
//            self.color = color
//            colorView = UIView()
//            colorView.translatesAutoresizingMaskIntoConstraints = false
//            colorView.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
//            colorView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
//            colorView.layer.masksToBounds = true
//            colorView.backgroundColor = color
//            colorView.layer.cornerRadius = 12
//            colorView.layer.borderColor = UIColor(ciColor: .black).withAlphaComponent(0.5).cgColor
            
            
       
            
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func prepareForReuse() {
            super.prepareForReuse()
        }

}

