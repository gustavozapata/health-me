//
//  NutritionView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct NutritionView: View {
    var body: some View {
        NavigationView {
            Text("Your nutrition guide")
                .font(.title)
                .navigationBarTitle("Nutrition")
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
