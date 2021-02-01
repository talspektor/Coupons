//
//  OrderView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderCoupon: CustomerObservable
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(orderCoupon.orderList) { coupon in
                        HStack {
                            Text(coupon.title)
                            Spacer()
                            Text("$\(coupon.price, specifier: "%.2f")")
                        }
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let orderCoupon = CustomerObservable()
    static var previews: some View {
        OrderView().environmentObject(orderCoupon)
    }
}
