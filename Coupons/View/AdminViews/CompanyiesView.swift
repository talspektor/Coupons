//
//  CompanyiesView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 18/01/2021.
//

import SwiftUI

struct CompanyiesView: View {
    @EnvironmentObject var admin: AdminObservableObject
    var body: some View {
        NavigationView {
            List {
                ForEach(admin.companies) { company in
                    CompanyItemView(company: company)
                }
            }.navigationTitle("Companies")
            .listStyle(GroupedListStyle())
        }
    }
}

struct CompanyiesView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyiesView()
    }
}
