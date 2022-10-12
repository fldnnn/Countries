//
//  DetailCardPresenter.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import Foundation

class DetailCardPresenter {

    // MARK: - Properties
    weak var view: DetailCard.View?
    var router: DetailCard.Router!
    var interactor: DetailCard.Interactor!
    var countryCode: String?
}

extension DetailCardPresenter: DetailCardPresenterProtocol {
    // TODO: implement presentation methods
}

extension DetailCardPresenter: DetailCardInteractorToPresenterProtocol {
    // TODO: implement interactor output methods
    func viewDidLoad() {
        interactor?.fetchDetailCountry(with: countryCode ?? "")
    }
}
