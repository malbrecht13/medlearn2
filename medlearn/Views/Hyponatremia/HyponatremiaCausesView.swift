//
//  HyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HyponatremiaCausesView: View {
    
    @State private var plasmaSelection: Int = 1
    @State private var urineSelection: Int = 0
    @State private var volumeSelection: Int = 1
    @State private var urineNaSelection: Int = 0
    
    @State private var showingDetail = false
    @State private var showReferences = false
    
    @State private var half = false
    
    private let plasmaOsm = ["<275 mOsm/L", "Normal", ">295 mOsm/L"]
    private let urineOsm = ["<100 mOsm/L", ">100 mOsm/L"]
    private let urineNa = ["<30 mEq/L", ">30 mEq/L"]
    private let volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    
    
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
                
                
                
                ShowPicker(parentBinding: $plasmaSelection, text: "Select plasma osmolality", parentArray: plasmaOsm)
                
                //only enable options below "select serum osmolality
                //if plasmaSelection is option 0
                ShowPicker(parentBinding: $urineSelection, text: "Select urine Osmolality", parentArray: urineOsm)
                    .disabled(plasmaSelection != 0)
                
                //only enable these Picker options if urineOsmolality is
                //greater than 100
                ShowPicker(parentBinding: $volumeSelection, text: "Select volume status", parentArray: volumeStatus)
                    .disabled(urineSelection == 0)
                //only enable if not Euvolemic
                //hyponatremia
                
                ShowPicker(parentBinding: $urineNaSelection, text: "Select urine sodium", parentArray: urineNa)
                    .disabled(urineSelection == 0 || volumeSelection == 1)
                   
                    
                
                
                
                
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    Text("Next")
                        .frame(width: 50, height: 30, alignment: .center)
                }.sheet(isPresented: $showingDetail) {
                    if self.plasmaSelection == 0 {
                        if self.urineSelection == 0 {
                            LowUrineOsmView()
                        } else if self.urineSelection == 1 {
                            if self.volumeSelection == 0 {
                                if self.urineNaSelection == 0 {
                                    HypovolemicHyponatremiaView()
                                } else {
                                    HypovolemicHyponatremiaView2()
                                }
                            } else if self.volumeSelection == 1 {
                                EuvolemicHypoNaView()
                            } else if self.volumeSelection == 2 {
                                HypervolemicHypoNaView()
                                
                            }
                        }
                    } else if self.plasmaSelection  == 1 {
                        IsotonicHyponatremia()
                    } else {
                        HypertonicHyponatremia()
                    }
                    
                } .buttonStyle(GradientButtonStyle())
                
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

