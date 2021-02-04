//
//  CouponDetail.swift
//  CouponSystem
//
//  Created by Tal talspektor on 15/01/2021.
//

import SwiftUI

struct CouponDetail: View {
    @EnvironmentObject var orderCoupon: CustomerObservable
    
    private let isForOrder: Bool
    private let coupon: Coupon
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    init(isForOrder: Bool, coupon: Coupon) {
        self.isForOrder = isForOrder
        self.coupon = coupon
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 6) {
                Image(coupon.imageUrl)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(coupon.description)
                    .padding([.leading, .top])
                if isForOrder {
                    Text("Amount left: \(coupon.amount)")
                        .padding([.leading, .top])
                }
                    
                Text("Expiration: \(coupon.endDate)")
                    .padding([.leading, .top])
                
                Spacer()
            }
            if isForOrder {
                Button("Order Couopn") {
                    orderCoupon.addOrder(coupon: coupon)
                }.font(.headline)
            }

            Spacer()
            
        }.navigationTitle(Text(coupon.title))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CouponDetail_Previews: PreviewProvider {
    static let orderCouopon = CustomerObservable()
    static var previews: some View {
        CouponDetail(isForOrder: true, coupon:  mockFoodCoupond[0]).environmentObject(orderCouopon)
    }
}
