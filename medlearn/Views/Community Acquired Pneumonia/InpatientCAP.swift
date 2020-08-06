//
//  InpatientCAP.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/6/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct InpatientCAP: View {
    var body: some View {
        VStack {
            Text("Determine whether severe vs. non-severe CAP")
                .font(.title)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .padding()
            VStack {
                HStack {
                    Text("")
                }
            }
        }
        
    }
}

struct InpatientCAP_Previews: PreviewProvider {
    static var previews: some View {
        InpatientCAP()
    }
}
