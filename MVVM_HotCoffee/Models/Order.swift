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

extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders/") else {
            fatalError("Url is incorrect!")
        }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(viewModel: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(viewModel)
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders/") else {
            fatalError("Url is incorrect!")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!") }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
        
    }
    
}

extension Order {
    
    init?(_ viewModel: AddCoffeeOrderViewModel) {
        
        guard let name = viewModel.name,
              let email = viewModel.email,
              let selectedType = CoffeeType(rawValue: viewModel.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: viewModel.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
