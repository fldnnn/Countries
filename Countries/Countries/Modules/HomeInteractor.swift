//
//  HomeInteractor.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//  
//

import Foundation

class HomeInteractor: Home.Interactor {

    // MARK: - Properties
    //weak var output: Home.InteractorToPresenter?
    var presenter: Home.Presenter?
    var data: CountryList?
    var temp = [String]()
    
    func fetchCountryList() {
        let headers = ["X-RapidAPI-Key": "3fff245794msh34a41605824e548p1a2d9bjsnb796d5ce1b80", "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(CountryList.self, from: data)
                self?.data = object

                DispatchQueue.main.async {
                    self?.presenter?.didDataFetch()
                }
            } catch {
                print(error)
            }
        
        }
        task.resume()
    }

}
