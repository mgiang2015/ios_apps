//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {}
    
    public func showNewItemView() {
        showingNewItemView = true
    }
}
