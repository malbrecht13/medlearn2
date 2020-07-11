//
//  ViewRouter.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/18/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ViewRouter: ObservableObject {
    
    @Published var currentView = "home"
    @Published var algorithmView = ""
}
