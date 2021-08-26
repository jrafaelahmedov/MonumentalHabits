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
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        return image
    }()

    weak var collectionView: UICollectionView!

    
    var weekDays : [CustomWeekDayHomePage] = []
    var days: [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    
    
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
    
    
    //MARK:- LifeCycle
    
    
    override func loadView() {
        super.loadView()
        
      
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        
        
        self.collectionView.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.register(WeekCellHomePage.self, forCellWithReuseIdentifier: WeekCellHomePage.identifier)
                self.collectionView.alwaysBounceVertical = true
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.clipsToBounds = true
        self.collectionView.bounces =  self.collectionView.contentOffset.y > 100
                self.collectionView.backgroundColor = .clear
//        self.collectionView.layout
        generateLabels()
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
       contentView.addSubview(collectionView)
       contentView.addSubview(habitLabel)
        
        
        contentView.addSubview(customHabit)
        
        
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
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.7),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            hamburgerImage.heightAnchor.constraint(equalToConstant: 50),
            hamburgerImage.widthAnchor.constraint(equalToConstant: 50),
            hamburgerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            hamburgerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            
            homeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 + topSafeAreaHeight),
            homeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            homeLabel.centerYAnchor.constraint(equalTo: hamburgerImage.centerYAnchor),
            
            
            profileImage.heightAnchor.constraint(equalToConstant: 44),
            profileImage.widthAnchor.constraint(equalToConstant: 44),

            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            homeImage.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 30),
            
            homeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            homeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            homeImage.heightAnchor.constraint(equalToConstant: 145),
            
            habitLabel.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 28),
            
            habitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            
            habitLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 19),
            collectionView.heightAnchor.constraint(equalToConstant: 50),
//            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            collectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: habitLabel.trailingAnchor, constant: 69),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            customHabit.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 11),
            customHabit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            customHabit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            customHabit.heightAnchor.constraint(equalToConstant: 70),
            customHabit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    //MARK:- Utils
    
    @objc func backAction(){
        print("Back pressed")
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
        return CGSize(width: 50, height: 50)
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
