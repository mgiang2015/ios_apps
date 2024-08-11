//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar(content: {
                Button(action: {
                    viewModel.showNewItemView()
                }, label: {
                    Image(systemName: "plus")
                })
            })
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(showingNewItemView: $viewModel.showingNewItemView)
            })
            
        }
    }
}

#Preview {
    ToDoListView()
}
