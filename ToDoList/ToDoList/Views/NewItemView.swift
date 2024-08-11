//
//  NewItemView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    // Helps to toggle ToDoListView::viewModel::showingNewItemView
    @Binding var showingNewItemView: Bool
    // Form to add new item
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
            
            Form {
                TextField("Title", text: $viewModel.title)
                
                // Due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                
                // Description
                TextField("Description", text: $viewModel.description)
                
                // Button
                TLButton(title: "Save", color: .accentColor) {
                    viewModel.save()
                    if (!viewModel.hasError) {
                        showingNewItemView = false
                    }
                }
            }
            .alert(isPresented: $viewModel.hasError, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.error))
            })
        }
        .padding()
    }
}

#Preview {
    NewItemView(showingNewItemView: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
