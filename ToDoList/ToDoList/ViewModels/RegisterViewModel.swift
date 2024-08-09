//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var fullName = "";
    @Published var email = "";
    @Published var password = "";
    @Published var errorMessage = "";
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: fullName,
                           email: email,
                           createdAt: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        guard emailPred.evaluate(with: email) else {
            errorMessage = "Incorrect email format"
            return false
        }
        
        guard password.count > 6 else {
            errorMessage = "Password has to be at least 6 characters"
            return false
        }
        
        return true
    }
}
