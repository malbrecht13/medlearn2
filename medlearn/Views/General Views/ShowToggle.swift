//
//  ShowToggle.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/6/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowToggle: View {
    
    @Binding var binding: Bool
    @Binding var count: Int
    let text: String
    
    var body: some View {
        Toggle(isOn: $binding) {
            Text(text)
        }
        .onTapGesture {
            if !self.binding {
                self.count += 1
            } else {
                self.count -= 1
            }
        }
    }
}
