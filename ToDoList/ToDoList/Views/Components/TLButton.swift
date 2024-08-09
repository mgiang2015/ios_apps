//
//  TLButton.swift
//  ToDoList
//
//  Created by Minh Giang Le on 8/8/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(color)
                Text(title).foregroundColor(.white).bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Title", color: .pink) {
        // Do nothing
    }
}
