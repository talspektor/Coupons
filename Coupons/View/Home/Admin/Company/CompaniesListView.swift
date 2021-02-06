//
//  CompanyiesView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 18/01/2021.
//

import SwiftUI

struct CompaniesListView: View {
//    @EnvironmentObject var admin: AdminObservableObject
    var companies: [Company]
    
    var body: some View {
        NavigationView {
            if let companies = companies {
                List {
                    ForEach(companies) { company in
                        CompanyItemView(company: company)
                    }
                }.navigationTitle("Companies")
                .listStyle(GroupedListStyle())
            }            
        }
    }
}

struct CompanyiesView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesListView(companies: [mockCompany])
    }
}
