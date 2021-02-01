//
//  Utils.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import Foundation

struct Utils {
    static func formatCouponsData(coupons: [Coupon]) -> [CategoryCoupons] {
        var categoryCouponsArr: [CategoryCoupons] = []
        let sortedCoupons = coupons.sorted{ $0.category > $1.category }
        var index = -1
        var category: Category?
        var categoryCouponsItem: CategoryCoupons?
        sortedCoupons.forEach { (coupon) in
            // new category
            if category != coupon.category {
                category = coupon.category
                index += 1
                categoryCouponsItem = CategoryCoupons(id: index, category: category!, coupons: [coupon])
                categoryCouponsArr.append(categoryCouponsItem!)
            } else {
                categoryCouponsArr[index].coupons.append(coupon)
            }
        }
        return categoryCouponsArr
    }
}


