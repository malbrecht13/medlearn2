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
    
    
    //properties are validated to take in correct values to textfields
    @Published var glucose: Double? {
        didSet {
            if glucose != nil {
                if !(glucose! >= 0.0 && glucose! <= 2000.0) {
                    glucose = nil
                }
            }
        }
    }
    @Published var na: Double? {
        didSet {
            if na != nil {
                if !(na! >= 0.0 && na! <= 250.0) {
                    na = nil
                }
            }
            
            
        }
    }
    
    
    @Published var plasmaSelection: Int = 1
    @Published var urineSelection: Int = 0
    @Published var volumeSelection: Int = 1
    @Published var urineNaSelection: Int = 0
    @Published var chronicSelection: Int = 0
}
