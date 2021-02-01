//
//  CouponView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import SwiftUI

struct CouponItemView: View {

    private let coupon: Coupon
    private let isForOrder: Bool
    
    init(isForOrder: Bool, coupon: Coupon) {
        self.isForOrder = isForOrder
        self.coupon = coupon
    }
    
    var body: some View {
        NavigationLink(destination: CouponDetail(isForOrder: isForOrder, coupon: coupon)) {
            HStack {
                Image(coupon.imageUrl)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(coupon.title)
                    Text(coupon.description)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponItemView(isForOrder: true, coupon: mockFoodCoupond[0])
    }
}
