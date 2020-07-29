//
//  GradientButtonStyle.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 100, minHeight: 10, maxHeight: 10)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .font(.headline)
            .shadow(color: .black, radius: 0, x: 1, y: 2)
    }
}

