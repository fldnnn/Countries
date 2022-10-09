//
//  HomeContract.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//  
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var presenter: Home.Presenter! { get set }
    
    func updateTable(_ items: [Cell])
}

protocol HomePresenterProtocol: AnyObject {
    var view: Home.View? { get set }
    var interactor: Home.Interactor! { get set }
    var router: Home.Router! { get set }
    
    func viewDidLoad()
    func didDataFetch()
    
}

protocol HomeInteractorProtocol: AnyObject {
//    var output: Home.InteractorToPresenter? { get set }
    
    var presenter: Home.Presenter? { get set }
    var data: CountryList? { get }
    
    func fetchCountryList()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
}

protocol HomeRouterProtocol: AnyObject {
    var presenter: Home.Presenter? { get set }
}

struct Home {
    typealias View = HomeViewProtocol
    typealias Interactor = HomeInteractorProtocol
    typealias InteractorToPresenter = HomeInteractorToPresenterProtocol
    typealias Presenter = HomePresenterProtocol
    typealias Router = HomeRouterProtocol
}
