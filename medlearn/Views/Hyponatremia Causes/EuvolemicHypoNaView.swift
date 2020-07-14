//
//  EuvolemicHypoNaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/13/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EuvolemicHypoNaView: View {
    var body: some View {
        VStack {
            Group {
                Text("Euvolemic hyponatremia causes")
                    .font(.title)
                    .padding(.top, 100)
                .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Text("SIADH")
                Text("Medications")
                Text("Stress")
                Text("Pain")
                Text("Nausea")
                Text("Glucocorticoid deficiency")
                Text("Hypothyroidism")
                    .padding(.bottom, 50)
            }
           
            Spacer()
            Spacer()
        }
    }
}

struct EuvolemicHypoNaView_Previews: PreviewProvider {
    static var previews: some View {
        EuvolemicHypoNaView()
    }
}
