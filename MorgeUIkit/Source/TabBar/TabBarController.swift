//
//  TabBar.swift
//  MorgeUIkit
//
//  Created by anna on 23.02.2023.
//

import UIKit

enum Tabs: Int {
    case home
    case progres
    case awards
    case account
}
final class tabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        
        
        let homeController = UIViewController()
        let progresController = UIViewController()
        let awardsController = UIViewController()
        let accountController = UIViewController()
        
        let homeNavigation = UINavigationController(rootViewController: homeController)
        let progresNavigation = UINavigationController(rootViewController: progresController)
        let awardsNavigation = UINavigationController(rootViewController: awardsController)
        let accoundNavigation = UINavigationController(rootViewController: accountController)
        
        homeNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.home,
                                                 image: Resources.Images.TabBar.home,
                                                 tag: Tabs.home.rawValue)
        progresNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progres,
                                                 image: Resources.Images.TabBar.progres,
                                                 tag: Tabs.progres.rawValue)
        awardsNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.awards,
                                                 image: Resources.Images.TabBar.awards,
                                                 tag: Tabs.awards.rawValue)
        accoundNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.account,
                                              image: Resources.Images.TabBar.account,
                                              tag: Tabs.account.rawValue)

        setViewControllers([
            homeNavigation,
            progresNavigation,
            awardsNavigation,
            accoundNavigation
        ], animated: false)
    }
}
