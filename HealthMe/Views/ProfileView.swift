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
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: MessagesView(message: MessagesData())) {
                        Image(systemName: "message").font(.system(size: 28.0, weight: .bold)).foregroundColor(Color.black)
                        Circle().fill(Color.green).frame(width: 13, height: 13).offset(x: -18, y: -12)
                    }
                }.padding(.horizontal)
                
                ProfileList(profile: ProfileData())
            }
            .navigationBarTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: ProfileData())
    }
}
