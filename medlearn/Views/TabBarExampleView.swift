//
//  TabBarExampleView.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/18/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct TabBarExampleView: View {
    
    var body: some View {
        
        TabView {
            VStack {
                MainMenuView()
            }
            .tabItem({ TabLabel(imageName: "waveform.path.ecg", label: "Medical algorithms")})
            
           
            VStack {
                
                References()
            }
            .tabItem({ TabLabel(imageName: "book.circle", label: "References")})
            
        }
    }
}

struct TabLabel: View {
    let imageName: String
    let label: String
    
    var body: some View {

        HStack {
            Image(systemName: imageName)
            Text(label)
        }
    }
}



struct TabBarExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarExampleView()
    }
}
