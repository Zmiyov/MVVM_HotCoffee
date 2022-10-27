//
//  AddCoffeeOrderViewModel.swift
//  MVVM_HotCoffee
//
//  Created by Vladimir Pisarenko on 27.10.2022.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
