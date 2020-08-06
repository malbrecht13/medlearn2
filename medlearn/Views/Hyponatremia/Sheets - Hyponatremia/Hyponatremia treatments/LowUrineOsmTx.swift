//
//  LowUrineOsmTx.swift
//  medlearn
//
//  Created by Michael Albrecht on 7/29/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct LowUrineOsmTx: View {
   
    
    var body: some View {
        VStack {
            Text("Hypotonic Hyponatremia:")
               .modifier(SheetTitle())
               .padding(.top, 20)
            Text("Low Urine Osmolality")
               .modifier(SheetTitle())
            Spacer()
               .frame(minHeight: 10, maxHeight: 50)
            Text("Treatment")
                       .padding(.bottom, 30)
                       .font(.headline)
                   Text("Chronic (>48h onset or unknown duration):")
                       .font(.footnote)
                       .fontWeight(.bold)
                   Text("Consult nephrology. If encephalopathic, correction with 3% NaCl as in acute treatment below.  Otherwise use fluid restriction, high protein diet.  Raise serum sodium no more than 8 mEq per 24 hour period. Risk factors for neurologic complications with rapid correction: alcoholism, malnourishment, hypokalemia, serum Na < 105, cirrhosis. Check Na q4 hours.")
                       .padding()
                       .padding(.bottom, 20)
                       .minimumScaleFactor(0.5)
                    Text("Acute (<48h onset) treatment")
                       .font(.footnote)
                       .fontWeight(.bold)
                    Text("Consult nephrology.  Consider 100 mL 3% NaCl repeated every 10 minutes for max total of 3 doses prn until severe symptoms resolve.  An infusion of 3% NaCl at rate of 1-2 mL/kg/h could be started for less severe symptoms with goal correction of 2 mEq/L/h. Check Na q2 hours.")
                       .padding()
                       .minimumScaleFactor(0.5)
            
           
                
        }
       
    }
}

struct LowUrineOsmTx_Previews: PreviewProvider {
    static var previews: some View {
        LowUrineOsmTx()
    }
}
