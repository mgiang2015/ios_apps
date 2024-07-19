//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
