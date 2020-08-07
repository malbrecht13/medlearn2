//
//  References.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI


struct Citation: Identifiable {
    let id = UUID()
    var first: String
    var italicized: String
    var last: String
    
    init(first: String, italicized: String, last: String) {
        self.first = first
        self.italicized = italicized
        self.last = last
    }
}

let citations : [Citation] =  [
    Citation(first: "Topic: Hyponatremia. Buffington, MA & Abreo, K.  Hyponatremia: A review. ", italicized: "Journal of Intensive Care Medicine.", last: " 2016;31(4):223- 236."),
    Citation(first: "Topic: Community-acquired pneumonia. Metlay et al. Diagnosis and treatment of adults with community-acquired pneumonia. ", italicized: "Am J Respir Crit Care Med.", last: "2019;200(7):e45-e67.")]

let mapped = citations.sorted { $0.first < $1.first }

struct References: View {

    var body: some View {
        ScrollView {
            
            Text("References")
                .font(.largeTitle)
                .fontWeight(.medium)
            VStack {
                ForEach(mapped.indices) { i in
                    Text(mapped[i].first)
                    + Text(mapped[i].italicized).italic()
                    + Text(mapped[i].last)
                }.padding()

            }
            .padding()
            
            
            Spacer()
        }
    .padding()
        .font(.footnote)

    }
}





struct References_Previews: PreviewProvider {
    static var previews: some View {
        References()
    }
}
