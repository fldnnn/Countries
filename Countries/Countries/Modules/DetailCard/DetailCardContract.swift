//
//  DetailCardContract.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import Foundation

protocol DetailCardViewProtocol: AnyObject {
    var presenter: DetailCard.Presenter! { get set }
}

protocol DetailCardPresenterProtocol: AnyObject {
    var view: DetailCard.View? { get set }
    var interactor: DetailCard.Interactor! { get set }
    var router: DetailCard.Router! { get set }
    
    func viewDidLoad()
    
}

protocol DetailCardInteractorProtocol: AnyObject {
    var output: DetailCard.InteractorToPresenter? { get set }
    
    func fetchDetailCountry(with countryCode: String)
}

protocol DetailCardInteractorToPresenterProtocol: AnyObject {
}

protocol DetailCardRouterProtocol: AnyObject {
    var presenter: DetailCard.Presenter? { get set }
}

struct DetailCard {
    typealias View = DetailCardViewProtocol
    typealias Interactor = DetailCardInteractorProtocol
    typealias InteractorToPresenter = DetailCardInteractorToPresenterProtocol
    typealias Presenter = DetailCardPresenterProtocol
    typealias Router = DetailCardRouterProtocol
}
