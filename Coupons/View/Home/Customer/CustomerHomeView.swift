//
//  CustomerHomeView.swift
//  Coupons
//
//  Created by Tal talspektor on 30/01/2021.
//

import SwiftUI

struct CustomerHomeView: View {
    @EnvironmentObject var app: CustomerObservable
    
    @ObservedObject var viewModel = CustomerHomeViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.allCategoryCoupons != nil || viewModel.userCategoryCoupons != nil {
                TabView {
                    if let allCategoryCoupons = viewModel.allCategoryCoupons {
                        CouponsListView(sections: allCategoryCoupons, title: "All Coupons", isForOrder: true)
                            .tabItem {
                                Image(systemName: "🛍️")
                                Text("Coupons")
                            }
                        OrderView()
                            .tabItem {
                                Image(systemName: "square.and.pencil")
                                Text("Order")
                            }
                    }
                    if let categoryCoupons = viewModel.userCategoryCoupons {
                        CouponsListView(sections: categoryCoupons, title: "My Coupons", isForOrder: false)
                            .tabItem {
                                Image(systemName: "star.fill")
                                Text("My Coupons")
                            }
                    }
                    
                }
            }
            if self.viewModel.shouldShowAlert {
                ErrorFetchDataAlertView()
            }
        }.onAppear {
            self.viewModel.useMockData = app.useMockData
            self.viewModel.getAllCoupons()
            self.viewModel.getCustomerCoupons()
        }
        
    }
}

struct CustomerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerHomeView()
    }
}
