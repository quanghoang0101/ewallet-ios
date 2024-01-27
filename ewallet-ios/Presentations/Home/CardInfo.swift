//
//  CardInfo.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import Foundation

struct CardInfo {
    let name: String
    let brand: String
    let exp: String
    let number: String
    
    static func CreateDataSource() -> [CardInfo] {
        let c1 = CardInfo(name: "Phan Quang Hoang", brand: "VISA", exp: "08/2028", number: "0000 **** **** 1122")
        let c2 = CardInfo(name: "Phan Quang Hoang", brand: "Mastercard", exp: "08/2030", number: "0000 **** **** 1133")
        let c3 = CardInfo(name: "Phan Quang Hoang", brand: "American Express", exp: "08/2027", number: "0000 **** **** 1144")
        let c4 = CardInfo(name: "Phan Quang Hoang", brand: "Discover", exp: "08/2026", number: "0000 **** **** 1155")
        let c5 = CardInfo(name: "Phan Quang Hoang", brand: "JCB", exp: "08/2028", number: "0000 **** **** 1166")
        let c6 = CardInfo(name: "Phan Quang Hoang", brand: "Citi", exp: "08/2030", number: "0000 **** **** 1177")
        let c7 = CardInfo(name: "Phan Quang Hoang", brand: "Standard Chartered Bank", exp: "08/2025", number: "0000 **** **** 1188")
        let c8 = CardInfo(name: "Phan Quang Hoang", brand: "Capital One", exp: "08/2024", number: "0000 **** **** 1199")
        let c9 = CardInfo(name: "Phan Quang Hoang", brand: "SBI", exp: "08/2029", number: "0000 **** **** 1100")
        return [c1, c2, c3, c4, c5, c6, c7, c8, c9];
    }
}


