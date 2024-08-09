//
//  User.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let createdAt: TimeInterval
}
