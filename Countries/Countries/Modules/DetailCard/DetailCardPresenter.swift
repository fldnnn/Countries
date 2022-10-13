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
    private var countryDetails: Detail?
}

extension DetailCardPresenter: DetailCardPresenterProtocol {
  
    func viewDidLoad() {
        interactor?.fetchDetailCountry(with: countryCode ?? "")
    }
    
    func infoButtonPressed(with wikiId: String) {
        router.navigateToInfoView(with: wikiId)
    }
}

extension DetailCardPresenter: DetailCardInteractorToPresenterProtocol {
    
    func didDataFetch(_ countryDetail: CountryDetail) {
        let url = URL(string:  countryDetail.data?.flagImageUri ?? "-")
        let request = URLRequest(url: url!)
        let items = countryDetail.data.map({
            DetailUI.init(code: $0.code, flagImageUri: request, wikiDataId: $0.wikiDataId, name: $0.name)
        })
        view?.updateCountryDetail(items!)        
    }
}
