//
//  CustomWeekDayHomePage.swift
//  MonumentalHabits
//
//  Created by Rafael on 25.08.21.
//

import UIKit

class CustomWeekDayHomePage : UIView {
    
    var day: String!
    var dayLabel : UILabel!
    var weekDayLabel: UILabel!
    var week : String!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(day : String , week : String) {
        self.day=day
        self.week=week
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
         dayLabel = UILabel()
         dayLabel.translatesAutoresizingMaskIntoConstraints = false
         let underlineAttribute:[NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Manrope-Bold", size: 16)!,
                .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            ]
            let underlineAttributedString = NSAttributedString(string: day, attributes: underlineAttribute)
        dayLabel.attributedText = underlineAttributedString
       
        dayLabel.textAlignment = .center
        self.addSubview(dayLabel)
        
        weekDayLabel = UILabel()
        weekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttribute1:[NSAttributedString.Key: Any] = [
               .font: UIFont(name: "Manrope-Bold", size: 10)!,
               .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
           ]
           let underlineAttributedString1 = NSAttributedString(string: week, attributes: underlineAttribute1)
        weekDayLabel.attributedText = underlineAttributedString1
        weekDayLabel.textAlignment = .center
        weekDayLabel.alpha = 0.5
        self.addSubview(weekDayLabel)
        }
    
    func addConstraints() {
        weekDayLabel.topAnchor.constraint(equalTo: topAnchor, constant: -15).isActive = true
        weekDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dayLabel.topAnchor.constraint(equalTo: weekDayLabel.bottomAnchor, constant: -3).isActive = true
        dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
