//
//  Extensions.swift
//  ToDoList
//
//  Created by Minh Giang Le on 8/8/24.
//

import Foundation

// extension: add functionalities into existing classes
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:] // empty dictionary
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch { // catch error
            return [:]
        }
    }
}
