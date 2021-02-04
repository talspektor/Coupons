//
//  OrderCouopon.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI
enum UserType: String {
    case admin = "Admin"
    case customer = "Customer"
    case company = "Conpany"
}
class CustomerObservable: ObservableObject {

    @Published var coupons: [CategoryCoupons]?
    @Published var myCouopns: [CategoryCoupons]?
    @Published var orderList = [Coupon]()
    @Published var useMockData: Bool = true
    @Published var isLoggedIn = false
    @Published var selectedType: UserType = UserType.company
    @Published var company: Company?
    @Published var customer: Customer?

    var order: Set<Coupon> = Set<Coupon>()
    
    var total: Double = 0
    
    init() {
//        fetchCoupons()
//        fetchMyCoupons()
    }
    
    func addToTotal(coupon: Coupon) {
        total += coupon.price
    }
    
    func addOrder(coupon: Coupon) {
        order.insert(coupon)
        if order.contains(coupon) {
            orderList.append(coupon)
        }
    }
    
    func add(coupon: Coupon) {
        var categoryCouopns = coupons?.first { $0.category.rawValue == coupon.categoryId }
        categoryCouopns?.coupons.append(coupon)
    }
    
    func addToMyCoupons(coupon: Coupon) {
        var categoryCouopns = myCouopns?.first { $0.category.rawValue == coupon.categoryId }
        categoryCouopns?.coupons.append(coupon)
    }
    //TODO: get coupons from REST API
    func fetchCoupons() {
//        if useMockData {
//            coupons = mockSections
//        }
//        CustomerServiceImp.shared.getAllCoupons { result in
//            switch result {
//            case .success(let coupons):
//                ()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    //TODO: get coupons from REST API
    func fetchMyCoupons() {
//        if useMockData {
//            myCouopns = mockSections
//        }
//        CustomerServiceImp.shared.getCustomerCoupons { result in
//            switch result {
//            case .success(let companies):
//                ()
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        func login(_ email: String, _ password: String) {
            
        }
    }
}
