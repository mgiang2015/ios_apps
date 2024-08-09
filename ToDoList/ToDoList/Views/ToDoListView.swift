//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar(content: {
                Button(action: {
                    // add todo list logic
                }, label: {
                    Image(systemName: "plus")
                })
            })
            
        }
    }
}

#Preview {
    ToDoListView()
}
