//
//  ProfileView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var profile: ProfileData
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        NavigationView {
            ProfileList(profile: ProfileData())
                .navigationBarTitle("Profile")
        }.onAppear(){
            if !account.isLogged {
                account.logout()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: ProfileData())
    }
}
