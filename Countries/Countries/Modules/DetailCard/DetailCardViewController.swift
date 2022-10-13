//
//  DetailCardViewController.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import UIKit
import WebKit

class DetailCardViewController: UIViewController {

    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Properties
    var presenter: DetailCard.Presenter!
    var wikiId: String?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        addFavButton()
    }
    @IBAction func informationButton(_ sender: Any) {
        presenter.infoButtonPressed(with: wikiId!)
    }
    
    private func addFavButton() {
        let favButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(detailFavButtonPressed))
        navigationItem.rightBarButtonItem = favButton
    }
    
    @objc private func detailFavButtonPressed() {
    
    }
}

extension DetailCardViewController: DetailCardViewProtocol {
    func updateCountryDetail(_ model: DetailUI) {
        countryCodeLabel.text = model.code
        webView.load(model.flagImageUri!)
        wikiId = model.wikiDataId
        navigationItem.title = model.name
    }
}
