//
//  SettingsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var account: AccountViewModel = .account
    @State var showPassSetup = false
    
    var body: some View {
        Form {
            Section(header: Text("THEME"), footer: Text("Display the dark mode for better readibility when you are in a dark environment")){
                Toggle(isOn: $account.isDark){
                    Text("Dark Mode")
                }.onChange(of: account.isDark){ value in
                    account.isDark = !account.isDark
                    if account.isDark {
                        UserDefaults.standard.set(true, forKey: "isDark")
                    } else {
                        UserDefaults.standard.set(false, forKey: "isDark")
                    }
                }
            }
            
            Section(header: Text("SECURITY"), footer: Text("Secure your data by enabling authentication when opening the app")){
                Toggle(isOn: $account.requiredPass){
                    Text("Require Authentication")
                }.onChange(of: account.requiredPass){ value in
                    account.requiredPass = !account.requiredPass /// toggle switch on/off
                    UserDefaults.standard.set(account.requiredPass, forKey: "requiredPass")
                    account.isUnlocked = true
                    if account.requiredPass && UserDefaults.standard.object(forKey: "passcode") == nil { /// if toggle is green && pass hasn't been set
                        account.showPassSetup = true  /// show sheet and set new passcode
                    }
                }
            }
        }.sheet(isPresented: $account.showPassSetup) {
            PasscodeView()
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
