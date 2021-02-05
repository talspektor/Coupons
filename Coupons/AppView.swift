//
//  AppView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var user: CustomerObservable
    
    var body: some View {
        if user.useMockData {
            HomeView()
        } else {
            if user.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
