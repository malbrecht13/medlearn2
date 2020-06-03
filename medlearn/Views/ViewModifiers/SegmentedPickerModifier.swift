//
//  SegmentedPickerModifier.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/3/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct SegmentedPickerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(minWidth: 200, maxWidth: 350)
        .pickerStyle(SegmentedPickerStyle())
        .background(Color.white)
        .labelsHidden()
        .border(Color.black)
        .clipped()
        .shadow(color: Color.black, radius: 1, x: 2, y: 2)
    }
}
