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
    @State var requireAuthentication = false
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        Form {
            Section(header: Text("THEME"), footer: Text("Display the dark mode for better readibility when you are in a dark environment")){
                Toggle(isOn: $account.isDark){
                    Text("Dark Mode")
                }.onChange(of: account.isDark){ value in
                    account.isDark = !account.isDark
                }
            }
            
            Section(header: Text("SECURITY"), footer: Text("Secure your data by enabling authentication when opening the app")){
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
