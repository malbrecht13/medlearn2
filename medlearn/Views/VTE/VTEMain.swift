//
//  VTEMain.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEMain: View {
    
    @ObservedObject var vte: VTE = VTE()
    @State private var nextScreen = false
    
    private let vteType = ["DVT", "PE"]
    
    private let fillColor = Color.pink

    
    var body: some View {
        
        
            ZStack {
                Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    Text("Venous Thromboembolic Disease")
                        .modifier(MyTitleModifier(fillColor: fillColor))
                        
                    
                    ShowPicker(parentBinding: $vte.vteType, text: "Select if treating DVT or PE", parentArray: vteType)
                    
                    
                    NavigationLink(destination: Provoked(), isActive: $nextScreen) {
                        EmptyView()
                    }
                    Button("Next") {
                        self.nextScreen.toggle()
                        } 
                    }.buttonStyle(GradientButtonStyle(fillColor: fillColor))
                    Spacer()
                }
                
                
                
            }
       
        
    }


struct VTEMain_Previews: PreviewProvider {
    static var previews: some View {
        VTEMain()
    }
}
