//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var error = ""
    @Published var hasError = false
    @Published var dueDate = Date()
    
    init() {}
    
    public func save() {
        validate()
        
        guard !hasError else {
            return
        }
        
        print("Saved")
    }
    
    private func validate() {
        hasError = false
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in the title field"
            hasError = true
            return
        }
        
        // 86400s = 24hr. Let users choose deadline as today
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            error = "Please pick a date that is today or later"
            hasError = true
            return
        }
    }
}
