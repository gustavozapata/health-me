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
                VStack(alignment: .leading, spacing: 8) {
                    Text(option.name).font(.system(size: 20))
                    //Image(systemName: "chevron.right")
                        //.resizable()
                        //.frame(width: 10, height: 15, alignment: .trailing)
                    Text(option.description).foregroundColor(.gray)
                }.padding(EdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0))
            }
        }.padding(.trailing, 20)
    }
}

struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList(profile: ProfileData())
    }
}
