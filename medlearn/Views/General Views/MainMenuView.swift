//
//  ContentView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HyponatremiaCausesView()) {
                    VStack(alignment: .leading) {
                        Text("Hyponatremia")
                    }
                }
                NavigationLink(destination: CAPMain()) {
                    VStack(alignment: .leading) {
                        Text("Community Acquired Pneumonia")
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
