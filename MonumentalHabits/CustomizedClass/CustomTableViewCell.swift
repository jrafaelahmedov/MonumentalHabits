//
//  CustomTableViewCell.swift
//  MonumentalHabits
//
//  Created by Rafael on 27.08.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let customHabitCollectionView: UIView? = nil
    var colors : [ColorCellPage] = []
    var habitNameLabel : UILabel!
    var collectionView: UICollectionView!
    var line : UIView!
    var bgView: UIView!
    var habitName: String!
    {
        didSet {
            habitNameLabel.text = habitName
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
               self.addCustomView()
               self.addConstraints()
               self.backgroundColor = .clear
               self.layer.cornerRadius = 12
               self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        bgView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 12
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        self.addSubview(bgView)
        
        habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
         let underlineAttribute:[NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Manrope-Bold", size: 14)!,
                .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            ]
        let underlineAttributedString = NSAttributedString(string: "\(String(describing: habitNameLabel.text))", attributes: underlineAttribute)
        habitNameLabel.attributedText = underlineAttributedString
        habitNameLabel.textAlignment = .center
        bgView.addSubview(habitNameLabel)
    
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(named: Utils.lineColor)
        bgView.addSubview(line)
        
       
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
        bgView.addSubview(collectionView)
        }
    
    func addConstraints() {
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        habitNameLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 0).isActive = true
        habitNameLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        habitNameLabel.trailingAnchor.constraint(equalTo: line.trailingAnchor, constant: 0).isActive = true

        line.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 117).isActive = true
        line.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0).isActive = true
        line.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalTo: bgView.heightAnchor).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true

        collectionView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 0).isActive = true
    }
}


extension CustomTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCellPage.identifier, for: indexPath) as! ColorCellPage
//           DispatchQueue.main.async {
            cell.color = self.colors[indexPath.item].color
        
            let borderWidth: CGFloat = 4
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = borderWidth
            cell.layer.borderColor = UIColor(ciColor: .black).withAlphaComponent(0.01).cgColor
            cell.backgroundColor = self.colors[indexPath.item].color
            cell.layer.cornerRadius = 12
            
//        }
        return cell
    }
}

extension CustomTableViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    
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
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension CustomTableViewCell {
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}


