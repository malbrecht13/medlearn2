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
    //character limits
    let naCharLimit = 3
    let glucCharLimit = 4
    
    //properties have character limits
    @Published var glucose: String = "" {
        didSet {
            if glucose.count > glucCharLimit {
                glucose = String(glucose.prefix(glucCharLimit))
            }
        }
    }
    @Published var na: String = "" {
        didSet {
            if na.count > naCharLimit {
                na = String(na.prefix(naCharLimit))
            }
        }
    }
    
    @Published var correctedNa: Int = 0
    
    @Published var plasmaSelection: Int = 1
    @Published var urineSelection: Int = 0
    @Published var volumeSelection: Int = 1
    @Published var urineNaSelection: Int = 0
    @Published var chronicSelection: Int = 0
}
