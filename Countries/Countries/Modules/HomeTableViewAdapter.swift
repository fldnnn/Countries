//
//  HomeTableViewAdapter.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//
//
//import UIKit
//
//class HomeTableViewAdapter: NSObject {
//    private let presenter: Home.Presenter!
//
//    init(presenter: Home.Presenter) {
//        self.presenter = presenter
//    }
//
//    private func setupCityTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
//        let identifier = "CityTableViewCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        if let cell = cell as? HomeTableViewCell {
//            cell.setup(cityName: getCityList()[indexPath.row])
//
//            return cell
//        }
//        return UITableViewCell()
//    }
//}
//
//extension HomeTableViewAdapter {
//    func itemCount() -> Int {
//        getCityList().count
//    }
//
//    func getCityList() -> [String] {
//        presenter.getCityList()
//    }
//}
//
//extension HomeTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
//
//    // MARK: - Table view data source
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        itemCount()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        setupCityTableViewCell(tableView: tableView, indexPath: indexPath)
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.onCityCellPressed(with: getCityList()[indexPath.row])
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        50.0
//    }
//}
