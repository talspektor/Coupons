//
//  CheckoutView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: OrderCoupon
    static let paymentTypes = ["Credit", "PayPal", "Bit"]
    @State private var pamenType = 0
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?",
                       selection: $pamenType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            Section(header: Text("Total: $\(order.total, specifier: "%.2f")")) {
                Button("Confirm order") {
                    // palce the order
                }
            }
            
        }.navigationBarTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = OrderCoupon()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
