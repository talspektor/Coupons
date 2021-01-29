//
//  MockData.swift
//  CouponSystem
//
//  Created by Tal talspektor on 18/01/2021.
//

import SwiftUI

struct MockData {
    @EnvironmentObject var orderCoupon: CustomerObservable
    
    static let shared = MockData()
    
    //TODO: get coupons from REST API
    func fetchCoupons() {
        #if DEBUG
        orderCoupon.coupons = mockSections
        #endif
    }
    //TODO: get coupons from REST API
    func fetchMyCoupons() {
        #if DEBUG
        orderCoupon.myCouopns = mockSections
        #endif
        
    }
}

#if DEBUG
var random: Int {
    return Int.random(in: 1..<1000)
}
var randomAmount: Int {
    return Int.random(in: 1..<20)
}
var randomPrice: Double {
    return Double.random(in: 10..<1000)
}
var randomCategury: Category {
    let random = Int.random(in: 0..<4)
    switch random {
    case 0:
        return Category.ELECTRICITY
    case 1:
        return Category.FOOD
    case 2:
        return Category.SPORTS
    case 3:
        return Category.VACATION
    default:
        return Category.ELECTRICITY
    }
}
var randomCoupon: Coupon {
    return Coupon(id: random, company: randomCompany, category: randomCategury, title: "title_\(random)", description: "This is some generic coupon description...", staertDate: Date(), endDate: Date() + 30, amount: randomAmount, price: randomPrice, imageUrl: "")
}
var randomCompany: Company {
    return Company(id: random, name: "company_\(random)", email: "company_\(random)@email.com", password: "pass\(random)", coupons: [randomCoupon, randomCoupon, randomCoupon, randomCoupon])
}
var randomCustomer: Customer {
    return Customer(id: random, firstName: "firstName_\(random)", lastName: "lastName_\(random)", email: "customer_\(random)@mail.com", password: "pass_\(random)", coupons: [randomCoupon, randomCoupon, randomCoupon, randomCoupon, randomCoupon, randomCoupon, randomCoupon, randomCoupon])
}
let mockCompanies = [
    randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany
]

let mockCustomers = [
    randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer
]
#endif

#if DEBUG
let mockElecticityCoupons = [
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity"),
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity"),
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity"),
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity"),
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity"),
    Coupon(id: random, company: mockCompany, category: Category.ELECTRICITY, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "electricity")
]
let mockFoodCoupond = [
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food"),
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food"),
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food"),
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food"),
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food"),
    Coupon(id: random, company: mockCompany, category: Category.FOOD, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "food")
]
let mockSportsCouopns = [
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports"),
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports"),
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports"),
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports"),
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports"),
    Coupon(id: random, company: mockCompany, category: Category.SPORTS, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "sports")

]
let mockVacationCoupons = [
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation"),
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation"),
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation"),
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation"),
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation"),
    Coupon(id: random, company: mockCompany, category: Category.VACATION, title: "title", description: "descript", staertDate: Date(), endDate: Date(), amount: 10, price: 200, imageUrl: "vacation")
]
let electricityCategoryCoupons = CategoryCoupons(id: Category.ELECTRICITY.hashValue, category: Category.ELECTRICITY, coupons: mockElecticityCoupons)
let foodCategoryCoupons = CategoryCoupons(id: Category.FOOD.hashValue, category: Category.FOOD, coupons: mockFoodCoupond)
let sportsCategoryCoupons = CategoryCoupons(id: Category.SPORTS.hashValue, category: Category.SPORTS, coupons: mockSportsCouopns)
let vacationCategorycouopns = CategoryCoupons(id: Category.VACATION.hashValue, category: Category.VACATION, coupons: mockVacationCoupons)
var data: [CategoryCoupons] = [
    electricityCategoryCoupons,
    foodCategoryCoupons,
    sportsCategoryCoupons,
    vacationCategorycouopns
]
var mockSections: [CategoryCoupons] = data

#endif
