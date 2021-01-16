//
//  ProfileList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ProfileList: View {
    var profile: ProfileData
    
    var body: some View {
        List {
            ForEach(profile.options){option in
                NavigationLink(destination: renderView(view: option.name)){
                    ProfileRow(profile: option)
                }
            }
        }
    }
}

func renderView(view: String) -> some View {
    switch view {
    case "Account":
        return AnyView(AccountView())
    case "Settings":
        return AnyView(SettingsView())
    case "Privacy":
//        return AnyView(PrivacyView())
//        return AnyView(SignUpView())
        return AnyView(OnboardingView(skip: .constant(false)))
    case "About Health Me":
        return AnyView(AboutView())
    default:
        return AnyView(AccountView())
    }
}

struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList(profile: ProfileData())
    }
}
