//
//  ContentView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let conditions = ["Hyponatremia", "Community-acquired pneumonia", "Venous thromboembolic disease"]
fileprivate let sortedConditions = conditions.sorted{$0 < $1}
fileprivate let views: [String: AnyView] = [
    "Hyponatremia": AnyView(HyponatremiaCausesView()),
    "Community-acquired pneumonia": AnyView(CAPMain()),
    "Venous thromboembolic disease": AnyView(VTEMain())
]

struct MainMenuView: View {
    
    
    
    
    var body: some View {
        NavigationView {
            List(sortedConditions, id: \.self) { condition in
                NavigationLink(destination: views[condition]) {
                    VStack(alignment: .leading) {
                        Text("\(condition)")
                    }
                }
                
            }
        .navigationBarTitle("Algorithms")
        
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
