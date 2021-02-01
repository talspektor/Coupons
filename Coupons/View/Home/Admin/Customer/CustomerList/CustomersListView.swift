//
//  CustomersView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 18/01/2021.
//

import SwiftUI

struct CustomersListView: View {
    var customers: [Customer]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(customers) { customer in
                    Text("Name: \(customer.firstName) \(customer.lastName)")
                }
            }.navigationTitle("Customers")
            .listStyle(GroupedListStyle())
        }
    }
}

struct CustomersListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomersListView(customers: [randomCustomer])
    }
}
