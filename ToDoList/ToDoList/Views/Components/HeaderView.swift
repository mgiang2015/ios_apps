//
//  HeaderView.swift
//  ToDoList
//
//  Created by Minh Giang Le on 19/7/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let foregroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(foregroundColor)
                .rotationEffect(.degrees(angle))
            
            VStack {
                Text(title)
                Text(subtitle)
            }
            .font(.system(size: 30))
            .foregroundColor(.white)
            .bold()
            .padding(.top, 100)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15.0, foregroundColor: .blue)
}
