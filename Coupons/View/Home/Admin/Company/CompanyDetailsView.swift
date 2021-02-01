//
//  CompanyDetailsView.swift
//  Coupons
//
//  Created by Tal talspektor on 23/01/2021.
//

import SwiftUI

struct CompanyDetailsView: View {
    var company: Company
    
    var body: some View {
        VStack {
            Text("Name: \(company.name)")
            Text("Email: \(company.email)")
        }
    }
}

struct CompanyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetailsView(company: randomCompany)
    }
}
