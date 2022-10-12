//
//  DetailCardInteractor.swift
//  Countries
//
//  Created by Fulden Onan on 10.10.2022.
//  
//

import Foundation

class DetailCardInteractor {

    // MARK: - Properties
    weak var output: DetailCard.InteractorToPresenter?

}

extension DetailCardInteractor: DetailCardInteractorProtocol {
    func fetchDetailCountry(with countryCode: String) {
        let headers = [
            "X-RapidAPI-Key": "3fff245794msh34a41605824e548p1a2d9bjsnb796d5ce1b80",
            "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(CountryDetail.self, from: data)

           
                DispatchQueue.main.async {
                    //self?.presenter?.didDataFetch()
                    
                    
        //                    self.data.map({ Cell.init(nameCell: $0.name, countryCode: $0.code)
        //                    })
                    print(object.data)
                    print(object.data?.flagImageUri)
                    
                    
        //                    UserDefaults.standard.set( , forKey: <#T##String#>)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}



