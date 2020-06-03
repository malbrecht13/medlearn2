//
//  HyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HyponatremiaCausesView: View {
    @State private var plasmaSelection: Int? = nil
    @State private var urineSelection: Int? = nil
    @State private var volumeSelection: Int? = nil
    
    var volumeStatus = ["Hypovolemic", "Euvolemic", "Hypervolemic"]
    let plasmaOsm = ["<275 mOsm/L", "275-295 mOsm/L", ">295 mOsm/L"]
    var urineOsm = ["<100 mOsm/L", ">100 mOsm/L"]
    
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
                        ForEach(0..<2) { item in
                            Text(self.urineOsm[item])

                        }
                        
                    }
                    .modifier(SegmentedPickerModifier())
                    
                }
                VStack {
                    Text("Select volume status ")
                        .font(.headline)
                    Picker(selection: self.$volumeSelection, label: Text("Volume status")) {
                        ForEach(0..<3) { item in
                            Text(self.volumeStatus[item])

                        }
                        
                    }
                    .modifier(SegmentedPickerModifier())
                    
                }
                Button("Go!") {
                    print("do something")
                }
                
                Spacer()

            }
        }
    }
    
    //methods
    
    func goToCauseScreen() {
        if plasma
    }
}

struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}
