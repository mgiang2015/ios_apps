//
//  ContentView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn(), !viewModel.currentUserId.isEmpty {
            TabView {
                ToDoListView().tabItem {
                    Label("Home", systemImage: "house")
                }
                
                ProfileView().tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
