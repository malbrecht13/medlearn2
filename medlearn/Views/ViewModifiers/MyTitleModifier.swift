//
//  MyTitleModifier.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/30/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct MyTitleModifier: ViewModifier {
    var fillColor = Color(hue: 0.67, saturation: 0.46, brightness: 0.69, opacity: 1.00)
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 300).font(.headline)
        .foregroundColor(Color.white)
        .padding(10)
        .cornerRadius(10.0)
        .background(RoundedRectangle(cornerRadius: 10).fill(fillColor))
        .shadow(color: Color.black, radius: 0, x: 1, y: 2)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).fill(Color.black))
        .padding(.top, 30)
    }
}
