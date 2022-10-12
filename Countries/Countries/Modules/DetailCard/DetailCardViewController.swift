//
//  DetailCardViewController.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import UIKit

class DetailCardViewController: UIViewController {

    // MARK: - Properties
    var presenter: DetailCard.Presenter!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        print("here detail card")
    }
}

extension DetailCardViewController: DetailCardViewProtocol {
    // TODO: implement view output methods
}
