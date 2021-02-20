//
//  HomeView.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var user: CustomerObservable

    var body: some View {
        NavigationView {
            switch user.selectedType {
            case UserType.admin:
                AdminHomeView()
            case UserType.company:
                ComapnyHameView()
            case UserType.customer:
                CustomerHomeView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
