//
//  CustomerServiceTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
@testable import Coupons

class CustomerServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        testLogin()
    }

    func testLogin() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.login(email: "customer_1@email.com", password: "pass_1") { (result) in
            switch result {
            case .success(let isLoggedin):
                assert(isLoggedin, "Loggedin")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Login fail error: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetAllCoupons() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.getAllCoupons { (result) in
            switch result {
            case .success:
                assert(true, "Get all coupons")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get all coupns fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCustomerCoupons() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.getCustomerCoupons { (result) in
            switch result {
            case .success:
                assert(true, "Get customer coupons")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get customer coupons fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testPurchaseCoupon() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.purchaseCoupon(id: 27) { (result) in
            switch result {
            case .success:
                assert(true, "purchase coupon")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "purchase coupon fali: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCouponsByCategory() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.getCoupons(categoty: .FOOD) { (result) in
            switch result {
            case .success:
                assert(true, "get couponsByCategory")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "get couponsByCategory fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCouponsByMaxPrice() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.getCoupons(maxPrice: 100) { (result) in
            switch result {
            case .success:
                assert(true, "getCoupons")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "getCoupons fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCustomer() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.shared.getCustomer { (result) in
            switch result {
            case .success:
                assert(true, "getCustomer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "getCustomer fail: \(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
