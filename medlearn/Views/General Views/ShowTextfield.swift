//
//  ShowTextfield.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowTextfield: View {
    
    let title: String
    @Binding var number: Double
    let units: String
    let themeColor: Color
    
    private let formatter: NumberFormatter = {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        return numFormatter
    }()
    
    var body: some View {
        Group {
            Text(title)
                .fontWeight(.semibold)
            HStack {
                TextField("", value: $number, formatter: formatter)
                    .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minWidth: 75, maxWidth: 100).border(number == 0 ? Color.red : themeColor, width: 3).cornerRadius(3)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
                    .keyboardType(.default)
                Text(units)
            }
        }
    }
}
