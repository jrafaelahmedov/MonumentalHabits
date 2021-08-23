//
//  CustomCheckBox.swift
//  MonumentalHabits
//
//  Created by Rafael on 20.08.21.
//

import UIKit

class CustomCheckBox: UIButton {
    let checkedImage = UIImage(named: Utils.checkBoxChecked)! as UIImage
    let uncheckedImage = UIImage(named: Utils.checkBoxUnChecked)! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(buttonChange(sender:)), for: .touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonChange(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
