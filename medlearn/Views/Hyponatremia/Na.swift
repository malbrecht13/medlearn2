//
//  Na.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/14/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class Na: ObservableObject {
    let charLimit3 = 3
    let charLimit4 = 4
    
    @Published var glucose: Double = 0
    @Published var na: Double = 0 {
        didSet {
            if !(na >= 0 && na <= 250) {
                na = 0
            }
            
        }
    }
    @Published var plasmaSelection: Int = 1
    @Published var urineSelection: Int = 0
    @Published var volumeSelection: Int = 1
    @Published var urineNaSelection: Int = 0
    @Published var chronicSelection: Int = 0
}
