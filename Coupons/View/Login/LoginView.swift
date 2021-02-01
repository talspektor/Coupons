//
//  LoginView.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: CustomerObservable
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    private var types: [UserType] = [.admin, .company, .customer]
    
    let verticalPaddingForFrom = 40.0
    var selection: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.blue, .red]),
                               center: .center,
                               startRadius: 100,
                               endRadius: 470)
                
                VStack(spacing: CGFloat(verticalPaddingForFrom)) {
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
                    
                    VStack {
                        Text("Choose user type")
                            .padding(4)
                            
                        HStack {
                            Button("\(types[0].rawValue)") {
                                self.user.selectedType = types[0]
                            }.buttonStyle(MyButtonStyle())

                            Button("\(types[1].rawValue)") {
                                self.user.selectedType = types[1]
                            }.buttonStyle(MyButtonStyle())

                            Button("\(types[2].rawValue)") {
                                self.user.selectedType = types[2]
                            }.buttonStyle(MyButtonStyle())

                        }.padding(4)
                        HStack {
                            Text("UserType: \(user.selectedType.rawValue)")
                                .multilineTextAlignment(.center)
                                .padding(4)
                        }
                        
                        
                    }.background(Color.white)
                    .cornerRadius(10)
                    .padding(4)

                    NavigationLink(destination: HomeView(), isActive: $user.isLoggedIn) {
                        Button(action: {
                            //if success navigate to home screen
                            guard !email.isEmpty && !password.isEmpty else { return }
                            //Call service loin
                            Repository.shared.login(withEmail: email, andPassword: password, forUser: self.user.selectedType) { result in
                                switch result {
                                case .success(let isLoggedIn):
                                    DispatchQueue.main.async {
                                        self.user.isLoggedIn = isLoggedIn
                                    }
                                case .failure(let error):
                                    print(error)
                                    // for testing
                                    DispatchQueue.main.async {
                                        self.user.isLoggedIn = true
                                    }
                                }
                            }
                        }, label: {
                            Text("Login")
                                .padding()
                        })
                    }
                    
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
                .padding(.horizontal, CGFloat(verticalPaddingForFrom))
            }.navigationTitle("Login")
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
