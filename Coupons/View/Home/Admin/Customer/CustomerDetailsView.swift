//
//  CustomerDetailsView.swift
//  Coupons
//
//  Created by Tal talspektor on 23/01/2021.
//

import SwiftUI

struct CustomerDetailsView: View {
    var customer: Customer
    var body: some View {
        VStack {
            Spacer()
            Text("Name: \(customer.firstName) \(customer.lastName)")
            Text("Email: \(customer.email)")
            Spacer()
        }
    }
}

struct CustomerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailsView(customer: randomCustomer)
    }
}
