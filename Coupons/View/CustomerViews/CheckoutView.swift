//
//  CheckoutView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: CustomerObservable
    @State private var paymenType = "Credit"
    @State private var showPurchaseConfirmationAlert = false

    let paymentTypes = ["Credit", "PayPal", "Bit"]

    var totlatPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)

        return formatter.string(from: NSNumber(value: total)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?",
                       selection: $paymenType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section(header: Text("Total: $\(order.total)")) {
                Button("Confirm order") {
                    //TODO:
                    // palce the order
                    // call servise to purchase coupon
                }
            }
            
        }
        .navigationBarTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPurchaseConfirmationAlert) {
            Alert(title: Text("Order confirm"),
                  message: Text("Your total was \(totlatPrice)"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = CustomerObservable()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
