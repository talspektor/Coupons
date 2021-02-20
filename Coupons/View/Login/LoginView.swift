//
//  LoginView.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: CustomerObservable
    @ObservedObject var viewModel = LoginViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false

    private var types: [UserType] = [.admin, .company, .customer]
    
    let verticalPaddingForFrom = 40.0
    var selection: String?
    
    var body: some View {
        NavigationView {
            Form {
                Text("Welcome to Coupons System")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)

                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)

                    TextField("Enter your email", text: $email)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)

                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.secondary)

                    SecureField("Enter password", text: $password)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)

                Picker("Choose user type:", selection: $user.selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(4)

                ZStack {
                    NavigationLink(destination: HomeView(), isActive: $user.isLoggedIn) {}

                    Button(action: {
                        viewModel.didTapSubmitButton(email: email, password: password, selectedType: user.selectedType) { (success) in
                            user.isLoggedIn = success
                            showAlert = !success
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Login")
                                .padding()
                            Spacer()
                        }
                    })
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

            }
            .navigationTitle("Login")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login fail"),
                      message: Text("Wrong credentianl"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct MyButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(2)
            .foregroundColor(.blue)
            .background(configuration.isPressed ? Color.gray : Color.white)
    }

}
