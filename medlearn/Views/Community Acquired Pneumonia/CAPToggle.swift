//
//  CAPToggle.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//for Toggles in Community Acquired pneumonia

class CAPToggle: ObservableObject {
    
    //variables from InpatientCAP.swift
    @Published var rrElevated = false
    @Published var pfElevated = false
    @Published var infiltrates = false
    @Published var confusion = false
    @Published var uremia = false
    @Published var leukopenia = false
    @Published var thrombocytopenia = false
    @Published var hypothermia = false
    @Published var hypotension = false
    @Published var shock = false
    @Published var mv = false
    @Published var minorCount = 0
    @Published var majorCount = 0
    
    //variables from Isolates.swift
    @Published var insignificantCount = 0
    @Published var influenza = false
    @Published var mrsa = false
    @Published var pseudomonas = false
    @Published var hospitalization = false
}
