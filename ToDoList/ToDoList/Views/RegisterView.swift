//
//  RegisterView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register", subtitle: "Start organising tasks", angle: -15.0, foregroundColor: .orange)
                
                // Login Form
                Form {
                    if (viewModel.hasError()) {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    
                    TextField("Full name", text: $viewModel.fullName).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                    TextField("Email address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Register", color: .blue) {
                        // register
                        viewModel.register()
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
