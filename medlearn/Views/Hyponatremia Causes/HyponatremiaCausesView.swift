//
//  HyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HyponatremiaCausesView: View {
    @State private var plasmaSelection: Int = 0
    @State private var urineSelection: Int = 0
    @State private var volumeSelection: Int = 0
    @State private var urineNaSelection: Int = 0
    
    @State var showingDetail = false
    @State var showReferences = false
    
    let plasmaOsm = ["<275 mOsm/L", "275-295 mOsm/L", ">295 mOsm/L"]
    let urineOsm = ["<100 mOsm/L", ">100 mOsm/L"]
    let urineNa = ["<30 mEq/L", ">30 mEq/L"]
    let volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    
    
    let fillColor = Color.blue
    let lineWidth: CGFloat = 3
    
    var body: some View {
            ZStack {
                        Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 50) {
                            
                            
                            Text("Hyponatremia: Determine Cause")
                                .modifier(MyTitleModifier(fillColor: fillColor))
                            
                            VStack {
                                Text("Select plasma osmolality")
                                    .font(.headline)
                                
                                Picker(selection: self.$plasmaSelection, label: Text("Plasma Osmolarity")) {
                                    ForEach(0..<plasmaOsm.count) { item in
                                        Text(self.plasmaOsm[item])
                                    }
                                }
                                .modifier(SegmentedPickerModifier())
                                
                            }
                            
                            VStack {
                                Text("Select urine osmolality")
                                    .font(.headline)
                                Picker(selection: self.$urineSelection, label: Text("Volume status")) {
                                    ForEach(0..<urineOsm.count) { item in
                                        Text(self.urineOsm[item])

                                    }
                                    
                                }
                                .modifier(SegmentedPickerModifier())
                                .disabled(self.plasmaSelection != 0)
                                
                            }
                            VStack {
                                Text("Select volume status")
                                    .font(.headline)
                                Picker(selection: self.$volumeSelection, label: Text("Volume status")) {
                                    ForEach(0..<volumeStatus.count) { item in
                                        Text(self.volumeStatus[item])
                                    }
                                }
                                .modifier(SegmentedPickerModifier())
                                .disabled(self.plasmaSelection != 0 || self.urineSelection == 0)
                                
                            }
                            
                            VStack {
                                Text("Select urine sodium")
                                    .font(.headline)
                                Picker(selection: self.$urineNaSelection, label: Text("Urine sodium")) {
                                    ForEach(0..<urineNa.count) { item in
                                        Text(self.urineNa[item])
                                    }
                                }
                                .modifier(SegmentedPickerModifier())
                                .disabled(self.plasmaSelection != 0 || self.urineSelection == 0 || volumeSelection == 1)
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

                                }
                            
                            Button(action: {
                                self.showReferences.toggle()
                            }) {
                                HStack {
                                    Text("References")
                                    Spacer()
                                }.sheet(isPresented: $showReferences) {
                                    References()
                                }
                                .padding()
                                
                            }
                            
                            
                            
                            
                }
                    
                
            }
        }
        
}

    

    
    //methods
    
 
    


struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}
