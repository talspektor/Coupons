//
//  AdminHomeView.swift
//  Coupons
//
//  Created by Tal talspektor on 30/01/2021.
//

import SwiftUI

struct AdminHomeView: View {
    @EnvironmentObject var app: CustomerObservable
    
    @ObservedObject var viewModel = AdminHomeViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.companies != nil || viewModel.customers != nil {
                TabView {
                    if let companies = viewModel.companies {
                        CompaniesListView(companies: companies)
                            .tabItem {
                                Image(systemName: "💼")
                                Text("Companies")
                            }
                    }
                    if let customers = viewModel.customers {
                        CustomersListView(customers: customers)
                            .tabItem {
                                Image(systemName: "💼")
                                Text("Customers")
                            }
                    }
                }
            } else {
                ErrorFetchDataAlertView(title: "No Data", message: "No companies and no customers, Admin can add compnies and customers", buttonTest: "Dismiss")
            }
            
        }.onAppear {
            self.viewModel.useMockData = app.useMockData
            self.viewModel.getComapnies()
            self.viewModel.getCustomers()
        }
        
    }
}

struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
    }
}
