//
//  HomeRouter.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//  
//

import UIKit

class HomeRouter {

    // MARK: - Properties
    var presenter: Home.Presenter?
    weak var vC: UIViewController?

    // MARK: - Static methods
    static func createModule() -> HomeViewController? {
        if let view = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "Home") as? HomeViewController {
            let presenter = HomePresenter()
            let interactor = HomeInteractor()
            let router = HomeRouter()

            view.presenter = presenter
            view.modalPresentationStyle = .fullScreen

            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router

           // interactor.output = presenter
            interactor.presenter = presenter

            router.presenter = presenter
            router.vC = view
        
            return view
        }
        return nil
    }
}

extension HomeRouter: HomeRouterProtocol {
    // TODO: Implement wireframe methods
}
