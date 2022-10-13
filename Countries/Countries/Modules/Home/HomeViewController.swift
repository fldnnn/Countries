//
//  HomeViewController.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//  
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    private var tableViewHelper: HomeTableViewHelper!

    
    // MARK: - Properties
    var presenter: Home.Presenter!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
        }
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.lightGray
        
        changeColorTabBar(itemAppearance: appearance.stackedLayoutAppearance)
        changeColorTabBar(itemAppearance: appearance.inlineLayoutAppearance)
        changeColorTabBar(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    private func changeColorTabBar(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = UIColor.white
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        itemAppearance.normal.iconColor = UIColor.black
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    private func setupUI() {
        tableViewHelper = .init(with: homeTableView, vc: self, presenter: presenter)
    }
}

extension HomeViewController: HomeViewProtocol {
    // TODO: implement view output methods
    func updateTable(_ items: [Cell]) {
        tableViewHelper.setItem(items)
    }
}

//if let tabItems = tabBarController?.tabBar.items {
//    let anasayfaItem = tabItems[0]
//    let ayarlarItem = tabItems[1]
//    anasayfaItem.badgeValue = "1"
//    ayarlarItem.badgeValue = "Yeni"
//}
//let appearance = UITabBarAppearance()
//appearance.backgroundColor = UIColor.systemIndigo
//
//renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
//renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
//renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
//
//tabBarController?.tabBar.standardAppearance = appearance
//tabBarController?.tabBar.scrollEdgeAppearance = appearance
//
//
//}
//
//func renkDegistir(itemAppearance: UITabBarItemAppearance) {
////Seçili durum
//itemAppearance.selected.iconColor = UIColor.systemOrange
//itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
//itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
//
//
////Seçili olmayan durum
//itemAppearance.normal.iconColor = UIColor.white
//itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
//itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
//}
