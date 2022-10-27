//
//  OrdersTableViewController.swift
//  MVVM_HotCoffee
//
//  Created by Vladimir Pisarenko on 27.10.2022.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersUrl = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders/") else {
            fatalError("URL was incorrect")
        }
        let resource = Resource<[Order]>(url: coffeeOrdersUrl)
        
        WebService().load(resource: resource) { [weak self] result in
            
            switch result {
            case .success(let orders):
                print(orders)
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let viewModel = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.type
        cell.detailTextLabel?.text = viewModel.size
        
        return cell
    }
}
