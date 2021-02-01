//
//  ComapnyHameView.swift
//  Coupons
//
//  Created by Tal talspektor on 30/01/2021.
//

import SwiftUI

struct ComapnyHameView: View {
    @EnvironmentObject var app: CustomerObservable
    
    @ObservedObject var viewModel = CompanyHomeViewModel()
    @State private var isPresent = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(viewModel.company?.name ?? "")")
                    .fontWeight(.bold)
                    .font(.title)
                TabView {
                    if let categoryCoupons = viewModel.categoryCoupons {
                        CouponsListView(sections: categoryCoupons, title: "Coupons", isForOrder: false)
                            .onAppear() { self.viewModel.getCoupons() }
                            .tabItem {
                                Image(systemName: "star.fill")
                                Text("Coupons")
                            }
                    }
                    if let company = viewModel.company {
                        CompanyDetailsView(company: company)
                            .tabItem {
                                Image(systemName: "star.fill")
                                Text("Info")
                            }
                    }
                }.onAppear {
                    self.viewModel.useMockData = app.useMockData
                    self.viewModel.getCompany { company in
                        if let company = company {
                            self.app.company = company
                        } else {
                            self.isPresent = true
                        }
                    }
                    self.viewModel.getCoupons()
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: AddCouponView()) {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        
                        
                    }.background(Color.blue)
                    .cornerRadius(38.5)
                    .padding(.bottom, 56)
                    .padding(.trailing, 24)
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
                
            }
            
            if self.viewModel.shouldShowAlert {
                ErrorFetchDataAlertView()
            }
            
        }.sheet(isPresented: $isPresent) {
            self
        }
    }
}

struct ComapnyHameView_Previews: PreviewProvider {
    static var previews: some View {
        ComapnyHameView()
    }
}
