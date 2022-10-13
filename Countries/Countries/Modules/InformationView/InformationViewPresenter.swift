//
//  InformationViewPresenter.swift
//  Countries
//
//  Created by Fulden Onan on 13.10.2022.
//  
//

import Foundation

class InformationViewPresenter {

    // MARK: - Properties
    weak var view: InformationView.View?
    var router: InformationView.Router!
    var interactor: InformationView.Interactor!
    
    var wikiId: String?
}

extension InformationViewPresenter: InformationViewPresenterProtocol {
    // TODO: implement presentation methods
    func viewDidLoad() {
        if let url = URL(string: "https://www.wikidata.org/wiki/\(wikiId!)") {
            print(url)
            let request = URLRequest(url: url)
            view?.updateInfoView(request)
        }
    }
}

extension InformationViewPresenter: InformationViewInteractorToPresenterProtocol {
    // TODO: implement interactor output methods
}
