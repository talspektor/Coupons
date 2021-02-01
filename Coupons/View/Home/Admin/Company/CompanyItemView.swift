//
//  CompanyItemView.swift
//  Coupons
//
//  Created by Tal talspektor on 23/01/2021.
//

import SwiftUI

struct CompanyItemView: View {
    let company: Company
    var body: some View {
        VStack {
            Text("Name: \(company.name)")
        }
        
    }
}

struct CompanyItemView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyItemView(company: mockCompany)
    }
}
