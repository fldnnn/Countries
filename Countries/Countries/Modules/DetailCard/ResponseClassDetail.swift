//
//  ResponseClassDetail.swift
//  Countries
//
//  Created by Fulden Onan on 12.10.2022.
//

import Foundation

struct CountryDetail: Codable {
    let data: Detail?
}

struct Detail: Codable {
    let capital: String?
    let code: String?
    let callingCode: String?
    let currencyCodes: [String]?
    let flagImageUri: String?
    let name: String?
    let numRegions: Int?
    let wikiDataId: String?
}

struct DetailUI {
    let code: String?
    let flagImageUri: URLRequest?
    let wikiDataId: String?
}
