//
//  NaToggleView.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/20/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NaToggleView: View {
    
    @ObservedObject var na: Na
    
    @State private var showNext = false
    
    
    private let plasmaOsm = ["<275 mOsm/L", "Normal", ">295 mOsm/L"]
    private let urineOsm = ["<100 mOsm/L", ">100 mOsm/L", "Unknown"]
    private let urineNa = ["<30 mEq/L", ">30 mEq/L", "Unknown"]
    private let volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    private let chronicity = ["Acute (<48 hrs)", "Chronic", "Unknown"]
    
    private let fillColor = Color.blue
    
    var body: some View {
        ZStack {
            Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("Hyponatremia")
                .modifier(MyTitleModifier(fillColor: fillColor))
                
                ShowPicker(parentBinding: $na.plasmaSelection, text: "Select plasma osmolality", parentArray: plasmaOsm)
                
                if na.plasmaSelection == 0 {
                    ShowPicker(parentBinding: $na.chronicSelection, text: "Select if acute or chronic", parentArray: chronicity).disabled(na.plasmaSelection != 0)
                    
                    //only enable options below "select serum osmolality
                    //if plasmaSelection is option 0
                    ShowPicker(parentBinding: $na.urineSelection, text: "Select urine osmolality", parentArray: urineOsm)
                        .disabled(na.plasmaSelection != 0)
                    
                    //only enable these Picker options if urineOsmolality is
                    //greater than 100
                    ShowPicker(parentBinding: $na.volumeSelection, text: "Select volume status", parentArray: volumeStatus)
                        .disabled(na.urineSelection == 0)
                    //only enable if not Euvolemic
                    //hyponatremia
                    
                    ShowPicker(parentBinding: $na.urineNaSelection, text: "Select urine sodium", parentArray: urineNa)
                
                }
                //TODO: Next Button with NavigationLink
                NavigationLink(destination: NaHistory(na: na), isActive: $showNext, label: {
                    EmptyView()
                })
                Button(action: {
                    self.showNext.toggle()
                }) {
                    Text("Next")
                }.buttonStyle(GradientButtonStyle())
                    
                Spacer()
            }
        }
    }
}

struct NaToggleView_Previews: PreviewProvider {
    static var previews: some View {
        NaToggleView(na: Na())
    }
}
