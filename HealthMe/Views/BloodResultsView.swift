//
//  BloodResultsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodResultsView: View {
    var body: some View {
        NavigationView {
            Text("Your blood results")
                .font(.title)
                .navigationBarTitle("Blood Results")
        }
    }
}

struct BloodResultsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodResultsView()
    }
}
