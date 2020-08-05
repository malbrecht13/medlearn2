//
//  HypovolemicHyponatremiaView2.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/11/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HypovolemicHyponatremiaView2: View {
    var body: some View {
        VStack {
            Group {
                Text("Hypovolemic hyponatremia: Renal loss causes")
                    .font(.title)
                    .padding(.top, 100)
                .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Text("urine Na > 30 meq/dl: renal loss")
                    .font(.headline)
                    .padding(.bottom)
                Text("Diuretic")
                Text("Salt wasting nephropathy")
                Text("Cerebral salt wasting")
                Text("Bicarbonaturia")
                    .padding(.bottom, 50)
            }
           
            Spacer()
            Spacer()
        }
    }
}

struct HypovolemicHyponatremiaView2_Previews: PreviewProvider {
    static var previews: some View {
        HypovolemicHyponatremiaView2()
    }
}
