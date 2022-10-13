//
//  InformationViewViewController.swift
//  Countries
//
//  Created by Fulden Onan on 13.10.2022.
//  
//

import UIKit
import WebKit

class InformationViewViewController: UIViewController {

    @IBOutlet weak var infoWebView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var presenter: InformationView.Presenter!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        indicator.startAnimating()
         
        infoWebView.navigationDelegate = self
    }
}

extension InformationViewViewController: InformationViewViewProtocol {
    func updateInfoView(_ request: URLRequest) {
        infoWebView.load(request)
    }
}

extension InformationViewViewController: WKNavigationDelegate {
     
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish navigation")
        indicator.stopAnimating()
        indicator.isHidden = true
    }
}
