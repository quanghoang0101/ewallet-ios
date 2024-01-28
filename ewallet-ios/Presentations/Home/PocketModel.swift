//
//  PocketModel.swift
//  ewallet-ios
//
//  Created by hoang phan on 28/01/2024.
//

import Foundation

struct PocketModel {
    let title: String
    let name: String
    let money: String
    
    static func CreatePocketData() -> [PocketModel] {
        let datasource: [PocketModel] = [
            PocketModel(title: "🌴", name: "Travelling", money: "$2.000.00"),
            PocketModel(title: "💰", name: "Investment", money: "$2.000.50"),
            PocketModel(title: "💍", name: "Married", money: "$4.555.10"),
            PocketModel(title: "🚗", name: "Car", money: "$2.854.08"),
            PocketModel(title: "👶", name: "Kids", money: "$5.000.00"),
            PocketModel(title: "🏡", name: "House", money: "$4.100.10"),
            PocketModel(title: "🤰", name: "Pregnant", money: "$2.000.05"),
            PocketModel(title: "🏫", name: "School", money: "$3.150.50"),
            PocketModel(title: "🏥", name: "Health", money: "$2.000.00"),
            PocketModel(title: "🎉", name: "Party", money: "$1.000.05"),
            PocketModel(title: "👨‍💻", name: "Technology", money: "$3.000.10"),
        ]
        return datasource
    }
}
