//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {  // <-- this assignment should be done on the main thread
                self?.currentUserId = user?.uid ?? "";
            }
        }
    }
    
    public func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}
