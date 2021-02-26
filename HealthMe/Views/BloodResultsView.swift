//
//  BloodResultsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodResultsView: View {
    
    @State var listSelected = 0
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        NavigationView {
            ScrollView {
                if account.isLogged {
                    Picker(selection: $listSelected, label: Text("View")) {
                        Text("Detailed").tag(0)
                        Text("List").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding()
                    if listSelected == 0 {
                        ResultsList(type: "detailed")
                    } else {
                        ResultsList(type: "list")
                    }
                } else {
                    Text("Register or login to see your results").fontWeight(.semibold).foregroundColor(.gray).padding(.vertical, 30)
                }
            }.navigationBarTitle("Blood Results")
        }
    }
}

struct BloodResultsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodResultsView()
    }
}
