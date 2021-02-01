//
//  ComapnyHameView.swift
//  Coupons
//
//  Created by Tal talspektor on 30/01/2021.
//

import SwiftUI

struct ComapnyHameView: View {
    @ObservedObject var viewModel = CompanyHomeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(viewModel.company?.name ?? "")")
                TabView {
                    if let categoryCoupons = viewModel.categoryCoupons {
                        CouponsListView(sections: categoryCoupons, title: "Coupons", isForOrder: false)
                            .onAppear() { self.viewModel.getCoupons() }
                            .tabItem {
                                Image(systemName: "star.fill")
                                Text("Coupons")
                            }
                    }
                    CompanyDetailsView()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Info")
                        }
                }.onAppear {
                    self.viewModel.getCompany()
                    self.viewModel.getCoupons()
                }
            }
            if self.viewModel.shouldShowAlert {
                ErrorFetchDataAlertView()
            }
        }
        
    }
}

struct ComapnyHameView_Previews: PreviewProvider {
    static var previews: some View {
        ComapnyHameView()
    }
}
