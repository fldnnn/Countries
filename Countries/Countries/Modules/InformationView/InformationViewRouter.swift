//
//  InformationViewRouter.swift
//  Countries
//
//  Created by Fulden Onan on 13.10.2022.
//  
//

import UIKit

class InformationViewRouter {

    // MARK: - Properties
    var presenter: InformationView.Presenter?
    weak var vC: UIViewController?

    // MARK: - Static methods
    static func createModule(with wikiId: String) -> InformationViewViewController? {
        if let view = UIStoryboard(name: "InformationView", bundle: nil).instantiateViewController(withIdentifier: "InformationView") as? InformationViewViewController {
            let presenter = InformationViewPresenter()
            let interactor = InformationViewInteractor()
            let router = InformationViewRouter()

            view.presenter = presenter
            view.modalPresentationStyle = .fullScreen

            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            presenter.wikiId = wikiId

            interactor.output = presenter

            router.presenter = presenter
            router.vC = view
        
            return view
        }
        return nil
    }
}

extension InformationViewRouter: InformationViewRouterProtocol {
    // TODO: Implement wireframe methods
}
