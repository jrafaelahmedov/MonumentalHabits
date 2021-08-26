//
//  WeekCellHomePage.swift
//  MonumentalHabits
//
//  Created by Rafael on 25.08.21.
//

import UIKit

class WeekCellHomePage: UICollectionViewCell {
    
    static var identifier: String = "Cell"

        weak var customView: CustomWeekDayHomePage!

        override init(frame: CGRect) {
            super.init(frame: frame)

            let customView = CustomWeekDayHomePage(day: "1", week: "mon")
            customView.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(customView)
            NSLayoutConstraint.activate([
                self.contentView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
                self.contentView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            ])
            self.customView = customView
//            self.reset()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            self.reset()
        }

        func reset() {
            self.customView.dayLabel.textAlignment = .center
            self.customView.weekDayLabel.textAlignment = .center
        }
}
