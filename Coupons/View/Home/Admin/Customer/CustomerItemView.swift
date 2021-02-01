//
//  CustomerItemView.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

struct CustomerItemView: View {
    var customer: Customer
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(customer.firstName) \(customer.lastName)")
                .multilineTextAlignment(.leading)
        }
    }
}

struct CustomerItemView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerItemView(customer: randomCustomer)
    }
}
