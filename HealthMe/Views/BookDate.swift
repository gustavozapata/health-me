//
//  BookDate.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookDate: View {
    var body: some View {
        ScrollView {
            VStack { //Container
                
                
                VStack { //Section
                    Header(title: "When", subtitle: "Select a date and time")
                }//Section
                
                Image(systemName: "person").font(.system(size: 295))
                
                VStack { //Section
                    Header(title: "When you think it's going to happen", subtitle: "Select a date and time for you to bring yourself down to the practice")
                } //Section
                
            } //Container
                .navigationBarTitle("Book Test")
        }
    }
}

struct BookDate_Previews: PreviewProvider {
    static var previews: some View {
        BookDate()
    }
}
