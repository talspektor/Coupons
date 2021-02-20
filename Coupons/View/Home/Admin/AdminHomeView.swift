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
    @State private var shouldShowAlert: Bool = false
    @State private var companies = [Company]()
    @State private var customers = [Customer]()
    
    var body: some View {
        ZStack {
            if !companies.isEmpty || !customers.isEmpty {
                TabView {
                    if let companies = viewModel.companies {
                        CompaniesListView(companies: companies)
                            .tabItem {
                                Label("Companies", image: "💼")
                            }
                    }
                    if let customers = viewModel.customers {
                        CustomersListView(customers: customers)
                            .tabItem {
                                Label("Customers", image: "💼")
                            }
                    }
                }
            } /*else {
                ErrorFetchDataAlertView(title: "No Data", message: "No companies and no customers, Admin can add compnies and customers", buttonTest: "Dismiss")
            }*/
            AddButon(nextView: AddCouponView())
        }.onAppear {
            self.viewModel.useMockData = app.useMockData
            self.viewModel.getComapnies { showAlert in
                self.shouldShowAlert = showAlert
                self.companies = viewModel.companies ?? <#default value#>
                self.customers = viewModel.customers
            }
            self.viewModel.getCustomers { showAlert in
                self.shouldShowAlert = showAlert
            }
        }.alert(isPresented: $shouldShowAlert) {
            Alert(title: Text("Connection Fail"),
                  message: Text(viewModel.errorMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
    }
}
