//
//  Isolates.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct Isolates: View {
    
    @ObservedObject var capToggle: CAPToggle
    
    @State private var showNext = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select all that apply").font(.subheadline).fontWeight(.black).foregroundColor(Color.pink)) {
                    ShowToggle(binding: $capToggle.influenza, count: $capToggle.insignificantCount, text: "Influenza is positive")
                    ShowToggle(binding: $capToggle.mrsa, count: $capToggle.insignificantCount, text: "Prior respiratory isolation of MRSA")
                    ShowToggle(binding: $capToggle.pseudomonas, count: $capToggle.insignificantCount, text: "Prior respiratory isolation of P. aerugoinosa")
                    ShowToggle(binding: $capToggle.hospitalization, count: $capToggle.insignificantCount, text: "Hospitalized and treated with parenteral antibiotics in last 90 days")
                    
                    
                    
                }
                
                
            }
            NavigationLink(destination: CAPManagement(capToggle: capToggle), isActive: $showNext) {
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

struct Isolates_Previews: PreviewProvider {
    static var previews: some View {
        Isolates(capToggle: CAPToggle())
    }
}
