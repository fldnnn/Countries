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
