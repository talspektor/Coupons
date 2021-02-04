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
        let sortedCoupons = coupons.sorted{ $0.categoryId > $1.categoryId }
        var index = -1
        var category: Category?
        var categoryCouponsItem: CategoryCoupons?
        sortedCoupons.forEach { (coupon) in
            // new category
            if category?.rawValue != coupon.categoryId {
                category = Category(rawValue: coupon.categoryId)
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


