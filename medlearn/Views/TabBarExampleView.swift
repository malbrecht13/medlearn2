//
//  TabBarExampleView.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/18/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct TabBarExampleView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                if self.viewRouter.currentView == "home" {
                    MainMenuView()
                } else if self.viewRouter.currentView == "settings" {
                    Text("Settings")
                }
                Spacer()
                HStack {
                    Image(systemName: "house")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .padding(20)
                        .frame(width: geometry.size.width/3, height: 75)
                        .onTapGesture {
                            self.viewRouter.currentView = "home"
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 75, height: 75)
                        Image(systemName: "plus.circle.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height:75)
                            .foregroundColor(.blue)
                    }
                    .offset(y: -geometry.size.height/10/2)
                    Image(systemName: "gear")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .padding(20)
                        .frame(width: geometry.size.width/3, height: 75)
                        .onTapGesture {
                            self.viewRouter.currentView = "settings"
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color.white.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarExampleView()
    }
}
