//
//  HomeViewController.swift
//  MonumentalHabits
//
//  Created by Rafael on 23.08.21.
//

import UIKit

class HomeViewController : UITabBarController {
      
    
    // MARK:- Properties
    
    var scrollView: UIScrollView = {
         let v = UIScrollView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.backgroundColor = UIColor(named: Utils.lineColor)
         v.isScrollEnabled = true
         v.showsVerticalScrollIndicator = false
         v.showsHorizontalScrollIndicator = false
         v.isUserInteractionEnabled = true
         return v
     }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(patternImage: UIImage(named: Utils.home_page_background)!)
        return view
    }()
    
    
    let backgroundImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.home_page_background)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let hamburgerImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "hamburger_menu_icon"), for: .normal)
        return button
    }()
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Homepage"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Manrope-Bold", size: 18)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    let profileImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.profile_photo)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 22
        return image
    }()
    
    
    let homeImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.home_view_image)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        return image
    }()
    
    let habitLabel : UILabel = {
        let label = UILabel()
        label.text = "Habits".uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Manrope-Bold", size: 14)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
//        label.text = label.text!.capitalized
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let customHabit : CustomHabitCollectionView = {
        let habit = CustomHabitCollectionView(habitName: "test")
        habit.translatesAutoresizingMaskIntoConstraints = false
        habit.backgroundColor = .white
        return habit
    }()
    
    
    var tableView: UITableView? = nil
    var habitNames : [String] = []
    var colors : [ColorCellPage] = []
    var collectionView: UICollectionView!
    var weekDays : [CustomWeekDayHomePage] = []
    var days: [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    var hobitNames : [String] = []
    
    
    //MARK:- LifeCycle
    
    
    override func loadView() {
        super.loadView()
        tableRow()
        setupTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        setupCollectionView()
        addHabits()
        generateLabels()
        hobitNamesFunc()
        setupView()
        setupConstraints()
    }
    
    
    //MARK:- Setups
    
    func setupView(){
        contentView.addSubview(backgroundImage)
        contentView.addSubview(hamburgerImage)
        contentView.addSubview(homeLabel)
        contentView.addSubview(profileImage)
        contentView.addSubview(homeImage)
        contentView.addSubview(habitLabel)
        contentView.addSubview(collectionView)
        
        contentView.addSubview(tableView!)
        
        
        
       view.addSubview(scrollView)
       scrollView.addSubview(contentView)
    }
    
    func setupConstraints(){
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        let topSafeAreaHeight = safeFrame.minY
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -topSafeAreaHeight),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 1),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),

            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
//
            hamburgerImage.heightAnchor.constraint(equalToConstant: 50),
            hamburgerImage.widthAnchor.constraint(equalToConstant: 50),
            hamburgerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            hamburgerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
//
            homeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 + topSafeAreaHeight),
            homeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            homeLabel.centerYAnchor.constraint(equalTo: hamburgerImage.centerYAnchor),

//
            profileImage.heightAnchor.constraint(equalToConstant: 44),
            profileImage.widthAnchor.constraint(equalToConstant: 44),

            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//
            homeImage.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 30),

            homeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            homeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            homeImage.heightAnchor.constraint(equalToConstant: 145),

            habitLabel.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 28),

            habitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),

            habitLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),

            collectionView.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 19),
            collectionView.heightAnchor.constraint(equalToConstant: 50),

//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: habitLabel.trailingAnchor, constant: 69),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),

            
            tableView!.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 11),
            tableView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            tableView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//            tableView!.heightAnchor.constraint(equalToConstant: 300),
            tableView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    //MARK:- Utils
    
    @objc func backAction(){}
    
    
        func addHabits() {
            let habit = Utils.orangeColor
            habitNames.append(habit)
            let habit1 = Utils.selectedIndicatorColor
            habitNames.append(habit1)
            let habit2 = Utils.textColor
            habitNames.append(habit2)
            let habit3 = Utils.titleTextColor
            habitNames.append(habit3)
//            let habit4 = Utils.titleTextColor
//            habitNames.append(habit4)
//            let habit5 = Utils.titleLineColor
//            habitNames.append(habit5)
//            let habit6 = Utils.selectedIndicatorColor
//            habitNames.append(habit6)
        }
    
    func generateLabels() {
        for index in 0...6 {
            let weekDay: CustomWeekDayHomePage = {
                let day = CustomWeekDayHomePage(day: "\(index+1)", week: days[index])
                day.translatesAutoresizingMaskIntoConstraints = false
                return day
            }()
            weekDays.append(weekDay)
        }
    }
    
    func hobitNamesFunc() {
        for index in 0...6 {
            let hobit: String = {
                let hob = String("Habit \(index)")
                
                return hob
            }()
            hobitNames.append(hobit)
        }
    }
    
    
    func setupTable() {
        self.tableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .clear
            return tableView
        }()
        setupTableView()
    }
    
    func setupTableView(){
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.separatorStyle = .none
        self.tableView!.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell1")
        self.tableView!.alwaysBounceVertical = true
        self.tableView!.isPagingEnabled = true
        self.tableView!.showsHorizontalScrollIndicator = false
        
        self.tableView!.rowHeight = UITableView.automaticDimension
        self.tableView!.estimatedRowHeight = 70
        self.tableView!.clipsToBounds = true
        self.tableView!.bounces =  (self.tableView!.contentOffset.y) > 100
        self.tableView!.backgroundColor = .clear
       
    }
    
    func tableRow(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(collectionView)
            NSLayoutConstraint.activate([
                self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
                self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            ])
            self.collectionView = collectionView
    }
    
    func setupCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(WeekCellHomePage.self, forCellWithReuseIdentifier: WeekCellHomePage.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.clipsToBounds = true
        self.collectionView.bounces =  self.collectionView.contentOffset.y > 100
        self.collectionView.backgroundColor = .clear
    }
    
    func addColors(colorName : String, number : Int) {
        for _ in 0...number {
            let color: ColorCellPage = {
                let day = ColorCellPage(color: UIColor(named: colorName)!)
                day.translatesAutoresizingMaskIntoConstraints = false
                return day
            }()
            colors.append(color)
        }
    }
}

      //MARK:- Extensions

extension HomeViewController: UICollectionViewDataSource {

   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weekDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCellHomePage.identifier, for: indexPath) as! WeekCellHomePage
//        let data = self.data[indexPath.item]
        DispatchQueue.main.async {
        cell.customView.dayLabel.text = self.weekDays[indexPath.item].day
        cell.customView.weekDayLabel.text = self.weekDays[indexPath.item].week
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 12
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

  
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 1
        let headerView = UIView()
        // 2
        headerView.backgroundColor = .clear
        // 3
        return headerView
    }
    
    // separete cell
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 6
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 6
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomTableViewCell
//        DispatchQueue.main.async {
            self.colors.removeAll()
            self.addColors(colorName: self.habitNames[indexPath.row],number: 15)
            cell.habitName = self.hobitNames[indexPath.row]
            cell.colors = self.colors
//            let selected  = UIView()
//            selected.backgroundColor = .white
//            cell.selectedBackgroundView = selected
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = .clear
            cell.layer.cornerRadius = 12
//        }
        return cell
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
