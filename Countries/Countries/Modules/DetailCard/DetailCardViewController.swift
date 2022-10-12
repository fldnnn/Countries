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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func informationButton(_ sender: Any) {
    }
}

extension DetailCardViewController: DetailCardViewProtocol {
    func updateCountryDetail(_ model: DetailUI) {
        countryCodeLabel.text = model.code
        webView.load(model.flagImageUri!)
    }
}
