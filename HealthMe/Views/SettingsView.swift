//
//  SettingsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State var languageSelected = "English"
    @State var isDarkMode = false
    @State var requireAuthentication = false
    
    var body: some View {
        Form {
            Section(header: Text("LANGUAGE")){
                HStack {
                    Text("English")
                    Spacer()
                    if languageSelected == "English" {
                        Image(systemName: "checkmark").foregroundColor(Color.blue)
                    }
                }.contentShape(Rectangle()).onTapGesture {
                    self.languageSelected = "English"
                }
                HStack {
                    Text("Spanish")
                    Spacer()
                    if languageSelected == "Spanish" {
                        Image(systemName: "checkmark").foregroundColor(Color.blue)
                    }
                }.contentShape(Rectangle()).onTapGesture {
                    self.languageSelected = "Spanish"
                }
            }.contentShape(Rectangle())
            Section(header: Text("THEME"), footer: Text("Display the dark mode for better readibility when you are in a dark environment")){
                Toggle(isOn: self.$isDarkMode){
                    Text("Dark Mode")
                }
            }
            
            Section(header: Text("SECURITY")){
                Toggle(isOn: self.$requireAuthentication){
                    Text("Require Authentication")
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
