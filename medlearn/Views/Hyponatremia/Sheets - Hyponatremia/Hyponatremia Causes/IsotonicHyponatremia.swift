//
//  IsotonicHyponatremia.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct IsotonicHyponatremia: View {
    var body: some View {
        VStack {
            Group {
                Text("Isotonic hyponatremia (pseudohyponatremia) causes:")
                    .font(.title)
                    .padding(.top, 100)
                .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Hyperproteinemia")
                    .font(.headline)
                    .padding()
                Text("Multiple myeloma")
                Text("Macroglobulinemia")
                    .padding(.bottom, 30)
                Text("Hyperlipidemia")
                    .font(.headline)
                    .padding()
                Text("Markedly elevated triglycerides")
            }
           
            Spacer()
            Spacer()
        }
    }
}

struct IsotonicHyponatremia_Previews: PreviewProvider {
    static var previews: some View {
        IsotonicHyponatremia()
    }
}
