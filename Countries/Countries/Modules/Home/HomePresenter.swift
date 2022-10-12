//
//  HomePresenter.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//  
//

import Foundation

class HomePresenter {

    // MARK: - Properties
    weak var view: Home.View?
    var router: Home.Router!
    var interactor: Home.Interactor!
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presentation methods
    func didDataFetch() {
        guard let data = interactor.data else {return}
//        let items = (data.data).map {
//            CountryCellModel.init(name: ($0.name ?? "-"))
//        }
        
        //let items = data.data
        
        let items = data.data?.map({ Cell.init(nameCell: $0.name, countryCode: $0.code, wikiDataId: $0.wikiDataId)
        })
        print(items!)
        
        view?.updateTable(items!)
    }
    
    func viewDidLoad() {
        interactor.fetchCountryList()
    }
    
    func onHomeCellPressed(with countryCode: String) {
        router?.navigateToDetailCard(with: countryCode)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    // TODO: implement interactor output methods
}
