//
//  LoginView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15.0, foregroundColor: .pink)
                
                // Login Form
                Form {
                    if (viewModel.hasError()) {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    
                    TextField("Email address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", color: .blue) {
                        viewModel.login()
                    }
                }
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
