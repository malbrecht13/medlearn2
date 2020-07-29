//
//  SheetTitle.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct SheetTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .font(.title)
        .lineLimit(1)
        .multilineTextAlignment(.center)
    }
    
}
