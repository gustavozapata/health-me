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
        return VStack{
            Text("2")
            List {
                ForEach(profile.options){option in
                    NavigationLink(destination: renderView(view: option.name)){
                        ProfileRow(profile: option)
                    }
                }
                //.padding(.trailing, 20)
            }
//            Spacer()
            Text("3")
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
        return AnyView(PrivacyView())
    default:
        return AnyView(AccountView())
    }
}

struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList(profile: ProfileData())
    }
}
