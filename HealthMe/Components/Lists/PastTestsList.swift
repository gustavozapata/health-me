//
//  PastTestsList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct PastTestsList: View {
    var pastTests: BloodTestData
    
    var body: some View {
        VStack{
            List {
                ForEach(pastTests.pastTests){ test in
                    NavigationLink(destination: BloodTestInfo(test: test)){
                        PastTestRow(pastTest: test)
                    }
                }
            }.frame(height: CGFloat(pastTests.pastTests.count) * CGFloat(95))
        }
    }
}

struct PastTestsList_Previews: PreviewProvider {
    static var previews: some View {
        PastTestsList(pastTests: BloodTestData())
    }
}
