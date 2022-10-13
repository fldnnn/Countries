//
//  InformationViewContract.swift
//  Countries
//
//  Created by Fulden Onan on 13.10.2022.
//  
//

import Foundation

protocol InformationViewViewProtocol: AnyObject {
    var presenter: InformationView.Presenter! { get set }
    
    func updateInfoView(_ request: URLRequest)
}

protocol InformationViewPresenterProtocol: AnyObject {
    var view: InformationView.View? { get set }
    var interactor: InformationView.Interactor! { get set }
    var router: InformationView.Router! { get set }
    
    func viewDidLoad()
    
}

protocol InformationViewInteractorProtocol: AnyObject {
    var output: InformationView.InteractorToPresenter? { get set }
}

protocol InformationViewInteractorToPresenterProtocol: AnyObject {
}

protocol InformationViewRouterProtocol: AnyObject {
    var presenter: InformationView.Presenter? { get set }
}

struct InformationView {
    typealias View = InformationViewViewProtocol
    typealias Interactor = InformationViewInteractorProtocol
    typealias InteractorToPresenter = InformationViewInteractorToPresenterProtocol
    typealias Presenter = InformationViewPresenterProtocol
    typealias Router = InformationViewRouterProtocol
}
