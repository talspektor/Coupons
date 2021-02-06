//
//  AddButon.swift
//  Coupons
//
//  Created by Tal talspektor on 05/02/2021.
//

import SwiftUI

struct AddButon: View {
    var nextView: AddCouponView

    init(nextView: AddCouponView) {
        self.nextView = nextView
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: nextView) {
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
    }
}

struct AddButon_Previews: PreviewProvider {
    static var previews: some View {
        AddButon(nextView: AddCouponView())
    }
}
