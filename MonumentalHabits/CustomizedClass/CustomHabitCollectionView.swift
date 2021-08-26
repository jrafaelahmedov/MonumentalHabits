//
//  CustomHabbitCollectionView.swift
//  MonumentalHabits
//
//  Created by Rafael on 26.08.21.
//

import UIKit

class CustomHabitCollectionView : UIView {
    
    var habitName: String!
    var habitNameLabel : UILabel!
   
    var collectionView: UICollectionView!
    var line : UIView!
    var colors : [ColorCellPage] = []
//    var habitNames : [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(habitName : String) {
        self.habitName = habitName
        super.init(frame: .zero)
        self.addColors()
//        self.addHabits()
        self.addCustomView()
        self.addConstraints()
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
//        self.frame = CGRect(x: 0, y: 0, width: 0, height: 70)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
         let underlineAttribute:[NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Manrope-Bold", size: 14)!,
                .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            ]
        let underlineAttributedString = NSAttributedString(string: habitName, attributes: underlineAttribute)
        habitNameLabel.attributedText = underlineAttributedString
       
        habitNameLabel.textAlignment = .center
        self.addSubview(habitNameLabel)
        
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(named: Utils.lineColor)
        self.addSubview(line)
        
       
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ColorCellPage.self, forCellWithReuseIdentifier: ColorCellPage.identifier)
        collectionView.alwaysBounceVertical = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.bounces =  self.collectionView.contentOffset.y > 100
        collectionView.backgroundColor = .clear
        self.addSubview(collectionView)

        }
    
    func addConstraints() {
        habitNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        habitNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        habitNameLabel.trailingAnchor.constraint(equalTo: line.trailingAnchor, constant: 0).isActive = true
        
        line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 117).isActive = true
        line.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
     
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    func addColors() {
        let color = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color)
        let color1 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color1)
        let color2 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color2)
        let color3 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color3)
        
        let color4 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color4)
        
        let color5 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color5)
        
        let color6 = ColorCellPage(color: UIColor(named: Utils.selectedIndicatorColor)!)
        colors.append(color6)
    }
    
//    func addHabits() {
//        let habit = "Habit 0"
//        habitNames.append(habit)
//        let habit1 = "Habit 1"
//        habitNames.append(habit1)
//        let habit2 = "Habit 2"
//        habitNames.append(habit2)
//        let habit3 = "Habit 3"
//        habitNames.append(habit3)
//
//        let habit4 = "Habit 4"
//        habitNames.append(habit4)
//        let habit5 = "Habit 5"
//        habitNames.append(habit5)
//        let habit6 = "Habit 6"
//        habitNames.append(habit6)
//    }
}

extension CustomHabitCollectionView: UICollectionViewDataSource {

   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCellPage.identifier, for: indexPath) as! ColorCellPage
        DispatchQueue.main.async {
            cell.color = self.colors[indexPath.item].color
            cell.backgroundColor = self.colors[indexPath.item].color
            cell.layer.cornerRadius = 12
            
        }
        return cell
    }
}

extension CustomHabitCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension CustomHabitCollectionView: UICollectionViewDelegateFlowLayout {

  
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 54, height: 54)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10) //.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
