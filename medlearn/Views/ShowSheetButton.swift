//
//  ShowSheetButton.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct ShowSheetButton<Content: View>: View {
    @State var showsheet = false
    private var buttonText: String
    private var viewToShow: Content
    
    init(buttonText: String, viewToShow: Content) {
        self.buttonText = buttonText
        self.viewToShow = viewToShow
    }
    
    var body: some View {
        Button(action: {
            self.showsheet.toggle()
        }) {
            Text(buttonText)
        }.sheet(isPresented: $showsheet) {
            self.viewToShow
        }.buttonStyle(GradientButtonStyle())
    }
}

struct ShowSheetButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheetButton(buttonText: "Text", viewToShow: LowUrineOsmTx())
    }
}
