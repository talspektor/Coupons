//
//  ErrorFetchDataAlertView.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

struct ErrorFetchDataAlertView: View {
    var title: String?
    var message: String?
    var buttonTest: String?
    @State private var isAlertShowing = true
    var body: some View {
        Button {
            self.isAlertShowing = true
        } label: {
            Text("")
        }
        .background(Color.clear)
        .alert(isPresented: $isAlertShowing) {
            Alert(title: Text(title ?? "Error"), message: Text(message ?? "No Data"), dismissButton: .default(Text(buttonTest ?? "Got it.")))
        }

    }
}

struct ErrorFetchDataAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorFetchDataAlertView()
    }
}
