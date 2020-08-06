//
//  ShowPicker.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/5/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowPicker: View {
    
    @Binding var parentBinding: Int
    let text: String
    let parentArray: [String]
    
    var body: some View {
        VStack {
            Text(text)
                .font(.headline)
            Picker(selection: $parentBinding, label: Text(text)) {
                ForEach(0..<parentArray.count) { item in
                    Text(self.parentArray[item])
                }
                
            }
            .modifier(SegmentedPickerModifier())
        }
    }
}
