//
//  OrdersTableViewController.swift
//  MVVM_HotCoffee
//
//  Created by Vladimir Pisarenko on 27.10.2022.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersUrl = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders/") else {
            fatalError("URL was incorrect")
        }
        let resource = Resource<[Order]>(url: coffeeOrdersUrl)
        
        WebService().load(resource: resource) { result in
            
            switch result {
            case .success(let orders):
                print(orders)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
