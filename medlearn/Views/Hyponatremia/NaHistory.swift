//
//  NaHistory.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/20/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NaHistory: View {
    
    @ObservedObject var na: Na
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NaHistory_Previews: PreviewProvider {
    static var previews: some View {
        NaHistory(na: Na())
    }
}
