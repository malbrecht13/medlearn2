//
//  LowUrineOsmView.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/13/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct LowUrineOsmView: View {
    @State var showTreatments = false
    
    var body: some View {
        VStack {
             Group {
                 Text("Hypotonic Hyponatremia:")
                    .modifier(SheetTitle())
                    .padding(.top, 20)
                 Text("Low Urine Osmolality")
                    .modifier(SheetTitle())
                 Spacer()
                    .frame(minHeight: 10, maxHeight: 50)
                 Text("Causes")
                    .font(.headline)
                    .padding(.bottom, 30)
                VStack (alignment: .leading) {
                    Text("Primary Polydipsia")
                        .padding(5)
                    Text("Beer potomania")
                        .padding(5)
                    Text("Malnutrition")
                        .padding(5)
                    Text("Correction of hypovolemic hyponatremia with NS")
                        .padding(5)
                }
                    .font(.callout)
                    
             }
            
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            
            Button(action: {
                self.showTreatments.toggle()
            }) {
                Text("Show treatments")
            }.sheet(isPresented: $showTreatments) {
                LowUrineOsmTx()
            }.buttonStyle(GradientButtonStyle())
                
             
            
             
             Spacer()
        }
    }
}

struct LowUrineOsmView_Previews: PreviewProvider {
    static var previews: some View {
        LowUrineOsmView()
    }
}
