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
    
    let plasmaOsm = ["<275 mOsm/L", "275-295 mOsm/L", ">295 mOsm/L"]
    let urineOsm = ["<100 mOsm/L", ">100 mOsm/L"]
    let urineNa = ["<30 mEq/L", ">30 mEq/L"]
    let volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    
    
    let fillColor = Color.blue
    let lineWidth: CGFloat = 3
    
    var body: some View {
        ZStack {
            Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                Text("Hyponatremia: Determine Cause")
                    .modifier(MyTitleModifier(fillColor: fillColor))
                
                
                
                ShowPicker(parentBinding: $plasmaSelection, text: "Select plasma osmolality", parentArray: plasmaOsm)
                
                //only display options below "select serum osmolality
                //if plasmaSelection is option 0
                
                if self.plasmaSelection == 0 {
                    
                    ShowPicker(parentBinding: $urineSelection, text: "Select urine Osmolality", parentArray: urineOsm)
                    
                    //only display these Picker options if urineOsmolality is
                    //greater than 100
                    if urineSelection == 1 {
                        
                        ShowPicker(parentBinding: $volumeSelection, text: "Select volume status", parentArray: volumeStatus)
                        
                        //only display this VStack if not Euvolemic
                        //hyponatremia
                        if volumeSelection != 1 {
                            ShowPicker(parentBinding: $urineNaSelection, text: "Select urine sodium", parentArray: urineNa)
                        }
                    }
                    
                }
                
                
                
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    Text("Go!")
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


//struct ShowPicker: View {
//    
//    @Binding var parentBinding: Int
//    let text: String
//    let parentArray: [String]
//    
//    var body: some View {
//        VStack {
//            Text(text)
//                .font(.headline)
//            Picker(selection: $parentBinding, label: Text(text)) {
//                ForEach(0..<parentArray.count) { item in
//                    Text(self.parentArray[item])
//                }
//                
//            }
//            .modifier(SegmentedPickerModifier())
//        }
//    }
//}



struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}
