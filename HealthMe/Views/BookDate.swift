//
//  BookDate.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookDate: View {
    
    @State var isDateSelected = false
    @State var isTimeSelected = false
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack {
                    
                    VStack {
                        Header(title: "Date & Time", subtitle: "Select a date and time")
                    }
                    
                    VStack {
                        
                        DatePicker(isSelected: $isDateSelected)
                        
                        Text("Friday, August 19th 2020").font(.system(size: 18, weight: .semibold)).padding(30)
                        
                        TimePicker(isSelected: $isTimeSelected)
                        
                    }.padding(.bottom, 30)
                    
                }
                
            }.navigationBarTitle("Book Test")
            
            if isDateSelected && isTimeSelected {
                NavigationLink(destination: PaymentView()){
                    ConfirmButton()
                }
            }
        }
    }
}

struct BookDate_Previews: PreviewProvider {
    static var previews: some View {
        BookDate().environment(\.sizeCategory, .extraSmall)
    }
}
