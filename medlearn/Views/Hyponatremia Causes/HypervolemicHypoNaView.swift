//
//  HypervolemicLowUrineNaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/13/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HypervolemicHypoNaView: View {
    var body: some View {
        VStack {
            Group {
                Text("Hypervolemic hyponatremia causes:")
                    .font(.title)
                    .padding(.top, 100)
                .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Text("If low urine Na (<30 mEq/L)")
                    .font(.headline)
                    .padding()
                Text("Nephrotic syndrome")
                Text("CHF")
                Text("Cirrhosis")
                    .padding(.bottom, 50)
                Text("If high urine Na (>30 mEq/L)")
                    .font(.headline)
                    .padding()
                Text("Renal insufficiency")
                    .padding(.bottom, 50)
            }
           
            Spacer()
            Spacer()
        }
    }
}

struct HypervolemicLowUrineNaView_Previews: PreviewProvider {
    static var previews: some View {
        HypervolemicHypoNaView()
    }
}
