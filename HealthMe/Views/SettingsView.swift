//
//  SettingsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var isDarkMode = false
    var body: some View {
        Form {
            Section(header: Text("THEME"), footer: Text("Display the dark mode for better readibility when you are in a dark environment")){
                Toggle(isOn: self.$isDarkMode){
                 Text("Dark Mode")
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
