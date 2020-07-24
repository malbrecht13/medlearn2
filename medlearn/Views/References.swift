//
//  References.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct References: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("References")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding()
                    
                Text("Hyponatremia")
                    .fontWeight(.medium)
                    .padding()
                VStack (alignment: .leading) {
                    Text("Buffington, MA & Abreo, K.  Hyponatremia: A review. ")
                    + Text("Journal of Intensive Care Medicine.")
                        .italic()
                    + Text(" 2016;31(4):223- 236.")

                    
                        
                    
                Spacer()
                }
                .padding()
                .font(.footnote)
            }
        }
        
    }
}

struct References_Previews: PreviewProvider {
    static var previews: some View {
        References()
    }
}
