//
//  HyponatremiaView.swift
//  medlearn
//
//  Created by Michael Albrecht on 5/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HyponatremiaCausesView: View {
    
    @ObservedObject var na: Na = Na()
    
    @State private var showInfoPopover = false
    @State private var nextPage = false

    private let fillColor = Color.blue
    private let lineWidth: CGFloat = 3
    
    
    var body: some View {
        
        ZStack {
            Color(.gray).opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                Text("Hyponatremia")
                    .modifier(MyTitleModifier(fillColor: fillColor))
                
                
                
                VStack {
                    ShowTextfield(title: "Enter serum sodium", number: $na.na, units: "mEq/L", themeColor: fillColor)
                    ShowTextfield(title: "Enter serum glucose", number: $na.glucose, units: "mg/dL", themeColor: fillColor)
                    
                    
                }
                
                

                // "Next" button to go to next view
                Button("Next") {
                    if Int(self.na.na) != nil && Int(self.na.glucose) != nil {
                        self.nextPage = true
                        self.hideKeyboard()
                    }
                }.buttonStyle(GradientButtonStyle())
                //"Next" button navigates to NaToggleView via this link
                NavigationLink(destination: NaToggleView(na: na), isActive: $nextPage) {
                    EmptyView()
                }

                
                Spacer()
                
                //info button at bottom right of screen
                //It shows a popover with more information about hyponatremia.
                //The popover view is found in the method infoPopoverContent() in this
                //same file.
                HStack {
                    Spacer()
                    Button(action: {
                        self.showInfoPopover.toggle()
                    }) {
                        VStack {
                            Image(systemName: "info.circle")
                            .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                        }
                    }.popover(isPresented: $showInfoPopover, arrowEdge: .top) {
                        self.infoPopoverContent()
                    }.padding(.trailing, 30)
                        .padding(.bottom, 30)
                }

                
            }
            }

   
        }
    
    //MARK: - Methods
    
    func infoPopoverContent() -> some View {
        VStack{
            Text("This algorithm will walk you through how to diagnose and treat hyponatremia.  However, note that hyponatremia is very complex.  More than one cause may be present.  Volume status in individual patients is often difficult to define.  This is why the algorithm focuses on both history, exam, and lab values to give several ideas on what the problem might be and how to correct it.").padding(30)
            Spacer()
        }
    }
    
   

    
   
    
}






struct HyponatremiaView_Previews: PreviewProvider {
    static var previews: some View {
        HyponatremiaCausesView()
    }
}

