//
//  HypertonicHyponatremia.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HypertonicHyponatremia: View {
    var body: some View {
        VStack {
            Group {
                Text("Hypertonic hyponatremia causes:")
                    .font(.title)
                    .padding(.top, 100)
                .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Hyperglycemia")
                Text("Mannitol")
            }
           
            Spacer()
            Text("Note: An elevated plasma osmolality does not rule out hypotonic hyponatremia in the setting of elevated blood alcohols (e.g., ethanol, methanol) or in the setting of azotemia (elevated BUN) because urea and alcohols are ineffective osmoles that freely cross cell membranes.")
                .padding()
                .font(.footnote)
    
            Spacer()
        }
    }
}

struct HypertonicHyponatremia_Previews: PreviewProvider {
    static var previews: some View {
        HypertonicHyponatremia()
    }
}
