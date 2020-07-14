//
//  LowUrineOsmView.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/13/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct LowUrineOsmView: View {
    var body: some View {
        VStack {
             Group {
                 Text("Hypotonic Hyponatremia: Low Urine Osmolality")
                     .font(.title)
                     .padding(.top, 100)
                     .multilineTextAlignment(.center)
                     .padding()
                 Spacer()
                 Text("Causes")
                    .font(.headline)
                    .padding()
                VStack (alignment: .leading) {
                    Text("Primary Polydipsia")
                        .padding(5)
                    Text("Beer potomania")
                        .padding(5)
                    Text("Malnutrition")
                        .padding(5)
                }
                    .font(.callout)
                    
             }
            
             Spacer()
             Text("Treatment: fluid restriction, high protein diet")
             Text("Check literature")
             Spacer()
        }
    }
}

struct LowUrineOsmView_Previews: PreviewProvider {
    static var previews: some View {
        LowUrineOsmView()
    }
}
