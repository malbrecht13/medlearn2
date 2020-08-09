//
//  SevereCAP.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CAPManagement: View {
    
    @ObservedObject var capToggle: CAPToggle
    
    var body: some View {
        ScrollView {
            Group {
                Text("Management")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.pink)
                    .padding()
                Text("Results are tailored to selections you provided on previous screens")
                    .padding()
                    .font(.caption)
                
                //if severe CAP or prior mrsa or pseudomonas or recent hospitalization
                if capToggle.majorCount > 0 || capToggle.minorCount > 2 || capToggle.hospitalization || capToggle.mrsa || capToggle.pseudomonas {
                    Text("Order these tests:")
                        .font(.title)
                        .fontWeight(.medium)
                        .underline()
                        .padding()
                    VStack (alignment: .leading) {
                        Text("Sputum gram stain and culture")
                        Text("Blood cultures x 2")
                        Text("MRSA nasal PCR")
                        //if severe CAP
                        if capToggle.majorCount > 0 || capToggle.minorCount > 2 {
                            Text("Legionella urine antigen")
                            Text("Pneumococcal urine antigen")
                        }
                    }.padding()
                }
                
            }
            
            VStack {
                Group {
                    Text("Start empiric antibiotics:")
                        .font(.title)
                        .fontWeight(.medium)
                        .underline()
                        .padding(.bottom, 10)
                    Text("Antibiotic dosing must be tailored to renal function.  Consult pharmacist if needed.")
                        .font(.caption)
                        .padding()
                    Text("Choose a macrolide from the following:")
                        .font(.callout)
                        .padding()
                    VStack (alignment: .leading) {
                        Text("Azithromycin 500 mg q24 hours")
                        Text("Clarithromycin 500 mg q12 hours")
                    }
                    Text("OR")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    Text("Choose a respiratory fluroquinolone from the following:")
                        .font(.callout)
                        .padding()
                    VStack (alignment: .leading) {
                        Text("Levofloxacin 750 mg daily")
                        Text("Moxifloxacin 400 mg daily")
                    }
                    Text("PLUS")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.top)
                }.minimumScaleFactor(0.5)
                Group {
                    //if not at risk of pseudomonas
                    if !capToggle.pseudomonas && !capToggle.hospitalization {
                        Text("Add a β-lactam from the following:")
                            .font(.callout)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Ceftriaxone 1-2 g q24 hours")
                            Text("Ampicillin-sulbactam 1.5-3 g q6 hours")
                            Text("Cefotaxime 1-2 g q8 hours")
                            Text("Ceftaroline 600 mg q12 hours")
                        }
                    }
                    //if prior pseudomnas or severe CAP and recent hospitalization
                    if capToggle.pseudomonas || ((capToggle.majorCount > 0 || capToggle.minorCount > 2) && capToggle.hospitalization) {
                        Text("Add an antipseudomonal agent from the following:")
                            .font(.callout)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Piperacillin-tazobactam 4.5 g q6 hours")
                            Text("Cefepime 2 g q8 hours")
                            Text("Ceftazidime 2 g q8 hours")
                            Text("Imipenem 500 mg q6 hours")
                            Text("Meropenem 1 g q8 hours")
                            Text("Aztreonam 2 g q8 hours")
                        }
                    }
                    
                    //if prior mrsa positivity or severe CAP and recent hospitalization
                    if capToggle.mrsa || (capToggle.hospitalization && (capToggle.majorCount > 0 || capToggle.minorCount > 2)) {
                        Text("PLUS")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.top)
                        Text("Add one of these for MRSA coverage:")
                            .font(.callout)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Vancomyin 15 mg/kg q12 hours, adjust based on levels")
                            Text("Linezolid 600 mg q12 hours")
                        }
                    }
                    if capToggle.influenza {
                        Text("PLUS")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.top)
                        Text("Add oseltamavir 75 mg po bid x 5 days (renal adjust if CrCl < 60) regardless of duration of flu symptoms")
                            .font(.callout)
                            .padding()
                    }
                }.minimumScaleFactor(0.5)
                
                Text("Followup management")
                    .font(.title)
                    .fontWeight(.medium)
                    .underline()
                    .padding()
                //if were covering for MRSA
                VStack(alignment: .leading) {
                    if capToggle.mrsa || (capToggle.hospitalization && (capToggle.majorCount > 0 || capToggle.minorCount > 2)) {
                        Text("After 48 hours, if MRSA cultures and nasal PCR are negative and patient is improving, consider disconinuing MRSA coverage.")
                            .padding()
                    }
                    //if were treating pseudomonas
                    if capToggle.pseudomonas || ((capToggle.majorCount > 0 || capToggle.minorCount > 2) && capToggle.hospitalization) {
                        Text("After 48 hours, if pseudomonas cultures negative and patient is improving, consider deescalating pseudomonal antibiotic to a beta-lactam.")
                            .padding()
                    }
                    Text("Treatment duration is 5 days if patient improves rapidly (within about 48-72 hours).  Consider longer duration if less-rapid improvement.")
                        .padding()
                }
                
                
                
                
                
                
                
            }.padding()
            Spacer()
        }
       
        
    }
}

struct SevereCAP_Previews: PreviewProvider {
    static var previews: some View {
        CAPManagement(capToggle: CAPToggle())
    }
}
