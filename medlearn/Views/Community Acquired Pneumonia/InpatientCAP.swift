//
//  InpatientCAP.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/6/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct InpatientCAP: View {
    
    @State private var rrElevated = false
    @State private var pfElevated = false
    @State private var infiltrates = false
    @State private var confusion = false
    @State private var uremia = false
    @State private var leukopenia = false
    @State private var thrombocytopenia = false
    @State private var hypothermia = false
    @State private var hypotension = false
    @State private var shock = false
    @State private var mv = false
    @State private var minorCount = 0
    @State private var majorCount = 0
    @State private var showNext = false
    
    
    
    
    var body: some View {
        VStack {
            Text("Determine whether severe vs. non-severe CAP")
                .font(.title)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .padding()
            Form {
                Section(header: Text("IDSA/ATS Major criteria: \(majorCount)")) {
                    ShowToggle(binding: $shock, count: $majorCount, text: "Septic shock requiring vasopressors")
                    ShowToggle(binding: $mv, count: $majorCount, text: "Respiratory failure requiring mechanical ventilation")
                }
                if majorCount == 0 {
                    Section(header: Text("IDSA/ATS Minor criteria: \(minorCount)")) {
                        ShowToggle(binding: $rrElevated, count: $minorCount, text: "Resp rate ≥ 30")
                        ShowToggle(binding: $pfElevated, count: $minorCount, text: "PaO2/FiO2 ratio ≤ 250")
                        ShowToggle(binding: $infiltrates, count: $minorCount, text: "Multilobar infiltrates")
                        ShowToggle(binding: $confusion, count: $minorCount, text: "Confusion/disorientation")
                        ShowToggle(binding: $uremia, count: $minorCount, text: "Uremia (BUN ≥ 20)")
                        ShowToggle(binding: $leukopenia, count: $minorCount, text: "Leukopenia (WBC < 4,000 cells/µl)")
                        ShowToggle(binding: $thrombocytopenia, count: $minorCount, text: "Thrombocytopenia (platelets < 100,000 µl)").lineLimit(1).minimumScaleFactor(0.5)
                        ShowToggle(binding: $hypothermia, count: $minorCount, text: "Hypothermia (temp < 36℃)")
                        ShowToggle(binding: $hypotension, count: $minorCount, text: "Hypotension requiring aggressive fluids")
                    }
                    
                }
                Text("Note: Definition of severe CAP is one major criterion or three or more minor criteria")
                
                
            }
            Button(action: {
                self.showNext.toggle()
            }) {
                Text("Next")
            }.buttonStyle(GradientButtonStyle(fillColor: Color.pink))
        }
    }
}



struct InpatientCAP_Previews: PreviewProvider {
    static var previews: some View {
        InpatientCAP()
    }
}
