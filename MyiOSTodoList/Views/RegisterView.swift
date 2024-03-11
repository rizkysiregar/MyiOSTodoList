//
//  RegisterView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import SwiftUI

struct RegisterView: View {
   
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // header
            HeaderView(title: "Register", subTitlte: "Start organizing to do", angle: -15, background: Color.orange)
            
            Form {
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Cratea account", background: Color.green) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
