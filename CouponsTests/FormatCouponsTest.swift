//
//  FormatCouponsTest.swift
//  CouponsTests
//
//  Created by Tal talspektor on 01/02/2021.
//

import XCTest
@testable import Coupons

class FormatCouponsTest: XCTestCase {
    
    func testFormatCoupons() {
        let coupons = [mockFoodCoupond[0], mockSportsCouopns[0], mockElecticityCoupons[0], mockFoodCoupond[1], mockSportsCouopns[1], mockElecticityCoupons[1] ]
        let formatedCoupons = Utils.formatCouponsData(coupons: coupons)
        formatedCoupons.forEach {
            print($0.category)
            assert($0.coupons.count == 2)
        }
        assert(formatedCoupons.count == 3)
    }
}
