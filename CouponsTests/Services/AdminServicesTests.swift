//
//  AdminServicesTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
@testable import Coupons

class AdminServicesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testLogin() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.login(email: "com.admin@admin", password: "admin") { (result) in
            switch result {
            case .success(let isLoggedIn):
                assert(isLoggedIn, "Loggedin: \(isLoggedIn)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Login fail error: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCompanies() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.getCompanies { (result) in
            switch result {
            case .success:
                assert(true, "Get Companies")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Companies fail error: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCustomers() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.getCustomers { (result) in
            switch result {
            case .success(let customers):
                assert(true, "Get Customer: \(customers)")
                print("\(customers)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Customer fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.2021
    func testGetCompanyById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.getCompany(id: 25) { (result) in
            switch result {
            case .success(let company):
                assert(true, "Get Company: \(company)")
                print("\(company)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Company fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.2021
    func testGetCompanyByName() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.getCompany(name: "companyName_804") { (result) in
            switch result {
            case .success(let company):
                assert(true, "Get Company by name: \(company)")
                print("\(company)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Company by name fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.2021
    func testGetCustomerById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.getCustomer(id: 14) { (result) in
            switch result {
            case .success(let customer):
                assert(true, "Get Customer: \(customer)")
                print("\(customer)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.21
    func testAddCompany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 1, name: "test_ios", email: "test_ios", password: "test_ios", coupons: [])
        AdminServiceImp.shared.addCompany(company: company) { (result) in
            switch result {
            case .success(let isAdded):
                assert(isAdded, "Add company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Add company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 1, firstName: "test_ios", lastName: "test_ios", email: "test_ios", password: "test_ios", coupons: [])
        AdminServiceImp.shared.addCustomer(customer: customer) { (result) in
            switch result {
            case .success(let isCustomerAdded):
                assert(isCustomerAdded, "Add customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Add customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.21
    func testUpdateCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 18, firstName: "test_ios1", lastName: "test_ios1", email: "test_ios1", password: "test_ios1", coupons: [])
        AdminServiceImp.shared.updateCustomer(customer: customer) { (result) in
            switch result {
            case .success(let isCustomerUpdated):
                assert(isCustomerUpdated, "update customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "update customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.21
    func testUpdateComany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 30, name: "test_ios1", email: "test_ios1", password: "test_ios1", coupons: [])
        AdminServiceImp.shared.updateCompany(company: company) { (result) in
            switch result {
            case .success(let isCompanyUpdated):
                assert(isCompanyUpdated, "update cumpany")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "update cumpany fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.21
    func testDeleteComapny() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.deleteCompany(id: 29) { (result) in
            switch result {
            case .success(let isDeleted):
                assert(isDeleted, "delete company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "delete company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    //tested :) 29.1.21
    func testDeleteCustomer() {
        let expectation = XCTestExpectation()
        AdminServiceImp.shared.deleteCustomer(id: 17) { (result) in
            switch result {
            case .success(let isDeleted):
                assert(isDeleted, "delete company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "delete company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
