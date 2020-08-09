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
        
        TabView{
            
            MainMenuView()
               
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Medical algorithms")
                    }

                
            
            References()
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("References")
                }

        }
       
    }
}






struct TabBarExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarExampleView()
    }
}
