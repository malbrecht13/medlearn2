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
                Text("Hypovolemic hyponatremia: Extrarenal loss")
                    .font(.title)
                    .padding(.top, 100)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                    .frame(minHeight: 10, maxHeight: 20)
                    
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Causes")
                        .font(.headline)
                        .padding(.bottom, 30)
                        Text("Diarrhea")
                        Text("Vomiting")
                        Text("Burn injury")
                        Text("Pancreatitis")
                        Text("Trauma")
                    }.padding(50)
                    Spacer()
                }
                
                ShowSheetButton(buttonText: "Show treatment", viewToShow: HypovolemicTx())
                
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
