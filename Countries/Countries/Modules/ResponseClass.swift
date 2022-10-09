//
//  ResponseClass.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//

import Foundation

struct CountryList: Codable {
    let data: [Country]?
    let links: [Link]?
    let metadata: Meta?
    
}

struct Country: Codable {
    let code: String?
    let currencyCodes: [String]?
    let name: String?
    let wikiDataId: String?
}

struct Link: Codable {
    let rel: String?
    let href: String?
}

struct Meta: Codable {
    let currentOffset: Int?
    let totalCount: Int?
}

struct Cell {
    let nameCell: String?
}
