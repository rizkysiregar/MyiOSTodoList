//
//  LoginViewViewModel.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import FirebaseAuth
import Foundation


class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init () {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    private func validate() -> Bool{
        // reset error message
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields!"
            return false
        }
        
        //check email as foo@mail.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please input valid email address!"
            return false
        }
        
        print("login called")
        return true
        
    }
    
}
