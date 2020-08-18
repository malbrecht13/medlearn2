//
//  HyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HyponatremiaCausesView: View {
    
    @ObservedObject var na: Na = Na()
    
    @State private var showingDetail = false

    
    private let plasmaOsm = ["<275 mOsm/L", "Normal", ">295 mOsm/L"]
    private let urineOsm = ["<100 mOsm/L", ">100 mOsm/L"]
    private let urineNa = ["<30 mEq/L", ">30 mEq/L"]
    private let volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    private let chronicity = ["Acute (<48 hrs)", "Chronic (>48 hrs)"]
    
    
    private let fillColor = Color.blue
    private let lineWidth: CGFloat = 3
    
    
    
    var body: some View {
        ZStack {
            Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                Text("Hyponatremia")
                    .modifier(MyTitleModifier(fillColor: fillColor))
                
                Text("Select any that apply.  However, some of the buttons below are disabled if not needed for the cause determination.  Press the 'Next' button at any time.")
                    .font(.caption)
                    .padding()
                
                VStack {
                    ShowTextfield(title: "Enter serum sodium", number: $na.na, units: "mg/dL", themeColor: fillColor)
                }
                
                
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
                
                
                
                   
                    
                
                
                Button("Next", action: {
                    if self.na.na == 0 {
                        print("Invalid entry")
                    }
                }).buttonStyle(GradientButtonStyle())
                
                Spacer()
                
                
                
                
                
            }
            }
   
        }
}






struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}

