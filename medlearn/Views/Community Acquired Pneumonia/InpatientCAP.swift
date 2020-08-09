//
//  InpatientCAP.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/6/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct InpatientCAP: View {
    
    @ObservedObject var capToggle : CAPToggle = CAPToggle()
    
    @State private var showNext = false
    

    var body: some View {
        VStack {
            Text("Determine whether severe vs. non-severe CAP")
                .font(.title)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .padding(.top, -30)
                .padding()
            Text("Select all that apply")
                .font(.subheadline)
            Form {
                Section(header: Text("IDSA/ATS Major criteria: \(capToggle.majorCount)")) {
                    ShowToggle(binding: $capToggle.shock, count: $capToggle.majorCount, text: "Septic shock requiring vasopressors")
                    ShowToggle(binding: $capToggle.mv, count: $capToggle.majorCount, text: "Respiratory failure requiring mechanical ventilation")
                }
                if capToggle.majorCount == 0 {
                    Section(header: Text("IDSA/ATS Minor criteria: \(capToggle.minorCount)")) {
                        
                        ShowToggle(binding: $capToggle.rrElevated, count: $capToggle.minorCount, text: "Resp rate ≥ 30")
                        ShowToggle(binding: $capToggle.pfElevated, count: $capToggle.minorCount, text: "PaO2/FiO2 ratio ≤ 250")
                        ShowToggle(binding: $capToggle.infiltrates, count: $capToggle.minorCount, text: "Multilobar infiltrates")
                        ShowToggle(binding: $capToggle.confusion, count: $capToggle.minorCount, text: "Confusion/disorientation")
                        ShowToggle(binding: $capToggle.uremia, count: $capToggle.minorCount, text: "Uremia (BUN ≥ 20)")
                        ShowToggle(binding: $capToggle.leukopenia, count: $capToggle.minorCount, text: "Leukopenia (WBC < 4,000 cells/µl)")
                        ShowToggle(binding: $capToggle.thrombocytopenia, count: $capToggle.minorCount, text: "Thrombocytopenia (platelets < 100,000 µl)").lineLimit(1).minimumScaleFactor(0.5)
                        ShowToggle(binding: $capToggle.hypothermia, count: $capToggle.minorCount, text: "Hypothermia (temp < 36℃)")
                        ShowToggle(binding: $capToggle.hypotension, count: $capToggle.minorCount, text: "Hypotension requiring aggressive fluids")
                    }
                    
                }
                Text("Note: Definition of severe CAP is one major criterion or three or more minor criteria")
                
                
            }
            NavigationLink(destination: Isolates(capToggle: capToggle), isActive: $showNext) {
                EmptyView()
            }
            Button(action: {
                self.showNext.toggle()
            }) {
                Text("Next")
            }.buttonStyle(GradientButtonStyle(fillColor: Color.pink))
            .padding()
        }
    }
}



struct InpatientCAP_Previews: PreviewProvider {
    static var previews: some View {
        InpatientCAP()
    }
}
