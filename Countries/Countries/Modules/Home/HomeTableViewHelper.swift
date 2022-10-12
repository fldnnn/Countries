//
//  HomeTableViewHelper.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//

import UIKit

class HomeTableViewHelper: NSObject {
    weak var viewController: UIViewController?
    weak var homeTableView: UITableView?
    
    private var presenter: Home.Presenter!
    
    private var list: [Cell] = []
    
    init(with homeTableView: UITableView?, vc: UIViewController?, presenter: Home.Presenter!) {
        super.init()
        self.presenter = presenter
        self.homeTableView = homeTableView
        self.viewController = vc
        
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        
        registerCells()
    }
    
    private func registerCells() {
        homeTableView?.register(.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setItem(_ item: [Cell]) {
        self.list = item
        homeTableView?.reloadData()
    }
}

extension HomeTableViewHelper: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        let rowItem = list[indexPath.row]
        cell.countryNameLabel.text = rowItem.nameCell   

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowItem = list[indexPath.row]
        //rowItem.wikiDataId
        let countryCode = "\(rowItem.countryCode!)"
        presenter?.onHomeCellPressed(with: countryCode)
    }
}
