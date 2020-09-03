//
//  ProfileRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ProfileRow: View {
    var profile: ProfileModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(profile.name).font(.system(size: 17, weight: .semibold))
            Text(profile.description).foregroundColor(.gray).font(.system(size: 15))
        }.padding(EdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0))
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileRow(profile: profileData[0])
            //ProfileRow(profile: profileData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
