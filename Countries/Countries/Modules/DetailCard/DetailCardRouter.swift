//
//  DetailCardRouter.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import UIKit

class DetailCardRouter {

    // MARK: - Properties
    var presenter: DetailCard.Presenter?
    weak var vC: UIViewController?

    // MARK: - Static methods
    static func createModule(with countryCode: String) -> DetailCardViewController? {
        if let view = UIStoryboard(name: "DetailCard", bundle: nil).instantiateViewController(withIdentifier: "DetailCard") as? DetailCardViewController {
            let presenter = DetailCardPresenter()
            let interactor = DetailCardInteractor()
            let router = DetailCardRouter()

            view.presenter = presenter
            view.modalPresentationStyle = .fullScreen

            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            presenter.countryCode = countryCode

            interactor.output = presenter
//            interactor.presenter = presenter

            router.presenter = presenter
            router.vC = view
        
            return view
        }
        return nil
    }
}

extension DetailCardRouter: DetailCardRouterProtocol {
    // TODO: Implement wireframe methods
    func navigateToInfoView(with wikiId: String) {
        let detailCardVC = InformationViewRouter.createModule(with: wikiId) ?? UIViewController()
        vC?.navigationController?.pushViewController(detailCardVC, animated: true)
        print(wikiId)
    }
}
