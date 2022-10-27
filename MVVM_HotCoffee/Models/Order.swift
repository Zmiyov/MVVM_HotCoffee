//
//  Order.swift
//  MVVM_HotCoffee
//
//  Created by Vladimir Pisarenko on 27.10.2022.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappucino
    case lattee
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
