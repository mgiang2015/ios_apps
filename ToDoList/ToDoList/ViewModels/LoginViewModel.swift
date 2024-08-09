//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import FirebaseAuth
import Foundation

// ALL LOGIN LOGIC IS HERE
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // login with Firebase
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        guard emailPred.evaluate(with: email) else {
            errorMessage = "Incorrect email format"
            return false
        }
        
        return true
    }
    
    func hasError() -> Bool {
        return !errorMessage.isEmpty
    }
    
}
