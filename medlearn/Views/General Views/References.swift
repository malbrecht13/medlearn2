//
//  References.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI


struct Citation {
    let topic: String
    let first: String
    let italicized: String
    let last: String
    
    init(topic: String, first: String, italicized: String, last: String) {
        self.topic = topic
        self.first = first
        self.italicized = italicized
        self.last = last
    }
}

let citations : [Citation] =  [
    Citation(topic: "Hyponatremia", first: "Buffington, MA & Abreo, K.  Hyponatremia: A review. ", italicized: "Journal of Intensive Care Medicine.", last: " 2016;31(4):223- 236."),
    Citation(topic: "Community-acquired pneumonia", first:  "Metlay et al. Diagnosis and treatment of adults with community-acquired pneumonia. ", italicized: "Am J Respir Crit Care Med. ", last: "2019;200(7):e45-e67.")]

let sortedCitations = citations.sorted { $0.topic < $1.topic }


struct References: View {

    var body: some View {
        VStack {
            Text("References")
                .modifier(MyTitleModifier())
            Form {
                Section(header: Text("\(sortedCitations[0].topic)")) {
                    Group {
                        Text("\(sortedCitations[0].first)")
                            + Text("\(sortedCitations[0].italicized)").italic()
                        + Text("\(sortedCitations[0].last)")
                    }.font(.caption)
                    
                }
                Section(header: Text("\(sortedCitations[1].topic)")) {
                    Group {
                        Text("\(sortedCitations[1].first)")
                            + Text("\(sortedCitations[1].italicized)").italic()
                        + Text("\(sortedCitations[1].last)")
                    }.font(.caption)
                }
            }
        }

    }
}





struct References_Previews: PreviewProvider {
    static var previews: some View {
        References()
    }
}
