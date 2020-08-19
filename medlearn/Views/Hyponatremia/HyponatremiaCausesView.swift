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
    
    @State private var showInfoPopover = false

    
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
                
                Button(action: {
                    self.showInfoPopover.toggle()
                }) {
                    VStack {
                        Image(systemName: "info.circle")
                        .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                    }
                }.popover(isPresented: $showInfoPopover, arrowEdge: .top) {
                    self.infoPopoverContent()
                }
                
                
                VStack {
                    ShowTextfield(title: "Enter serum sodium", number: $na.na, units: "mg/dL", themeColor: fillColor)
                    ShowTextfield(title: "Enter serum glucose", number: $na.glucose, units: "mg/dL", themeColor: fillColor)
                    //this text uses a method called correctedSodium(na:glucose:)
                    Text("Corrected serum sodium: \(correctedSodium(na: $na.na, glucose: $na.glucose))").fontWeight(.bold).foregroundColor(correctedSodium(na: $na.na, glucose: $na.glucose) == 0 ? Color.black : fillColor)
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
    
    //MARK: - Methods
    
    func infoPopoverContent() -> some View {
        VStack{
            Text("This algorithm will walk you through how to diagnose and treat hyponatremia.  However, note that hyponatremia is very complex.  More than one cause may be present.  Volume status in individual patients is often difficult to define.  This is why the algorithm focuses on both history, exam, and lab values to give several ideas on what the problem might be.").padding(30)
            Spacer()
        }
    }
    
    func correctedSodium(na: Binding<Double?>, glucose: Binding<Double?>) -> Int {
        
        
        // unwrap the na and glucose.  If they are nil, return 0 for each
        let na = Double(na.wrappedValue ?? 0)
        let gluc = Double(glucose.wrappedValue ?? 0)
        
        if na == 0 || gluc == 0 {
            return 0
        }
        
        let result = Int(na + 1.6 * (gluc - 100) / 100)
        
        return result
    }
}






struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}

