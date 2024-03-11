//
//  LoginView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(
                    title: "To Do List", subTitlte: "Get thinks done", angle: 15, background: Color.pink)
                
                // login form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: Color.blue) {
                        viewModel.login()
                        
                    }
                    .padding()
                }
                .offset(y:-50)
                
                // create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account" , destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
