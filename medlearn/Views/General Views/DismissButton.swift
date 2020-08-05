//
//  DismissButton.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/5/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct DismissButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
            .frame(minWidth: 100, minHeight: 10, maxHeight: 10)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .foregroundColor(.black)
            .font(.headline)
            .shadow(color: .black, radius: 0, x: 1, y: 2)
        }
    }
}
