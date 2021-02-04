//
//  AddCouponView.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

struct AddCouponView: View {
    @EnvironmentObject var app: CustomerObservable
    
    @ObservedObject var viewModel = AddCouponViewModel()
    
    @State private var categories: [Category] = [
        .ELECTRICITY, .FOOD, .SPORTS, .VACATION
    ]
    var body: some View {
        ZStack {
            Form {
                Text("Add Coupon")
                    .fontWeight(.bold)
                    .font(.title)
                TextField("Title", text: $viewModel.title)
                Picker("Category", selection: $viewModel.coupon.categoryId) {
                    ForEach(0..<self.categories.count) {
                        Text(self.categories[$0].rawValue)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                TextField("Description", text: $viewModel.description)
                TextField("Amount", text: $viewModel.amount)
                    .keyboardType(.numberPad)
                TextField("Price", text: $viewModel.price)
                    .keyboardType(.numberPad)
                DatePicker("Start Date", selection: $viewModel.startDate)
                DatePicker("End Date", selection: $viewModel.endDate)
                TextField("Image url", text: $viewModel.coupon.imageUrl)
                
                Button {
                    viewModel.addCoupon(forCompany: app.company!)
                } label: {
                    Text("Submit")
                        .font(.title3)
                }
                
            }
            if viewModel.shouldShowAlert {
                ErrorFetchDataAlertView(title: "Fail..",
                                        message: "Cant add coupon",
                                        buttonTest: "Dismiss")
            }
            
        }
        
    }
}

struct AddCouponView_Previews: PreviewProvider {
    static var previews: some View {
        AddCouponView()
    }
}
