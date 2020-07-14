//
//  HypovolemicHyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/18/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HypovolemicHyponatremiaView: View {
    
    var body: some View {
        
        
        VStack {
            Group {
                Text("Hypovolemic hyponatremia: Extrarenal loss causes")
                    .font(.title)
                    .padding(.top, 100)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text("urine Na < 30 meq/dL:  extrarenal loss")
                    .font(.headline)
                    .padding(.bottom)
                Text("Diarrhea")
                Text("Vomiting")
                Text("Burn injury")
                Text("Pancreatitis")
                Text("Trauma")
                    .padding(.bottom, 50)
            }
           
            Spacer()
            Spacer()
        }
//        TabView(selection: $selected) {
//            Hy()
//                .tabItem {
//                    Text("Home")
//            }
//
//        }
    }
}

struct HypovolemicHyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HypovolemicHyponatremiaView()
    }
}
