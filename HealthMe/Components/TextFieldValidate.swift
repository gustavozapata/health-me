//
//  TextFieldValidate.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 15/04/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import Combine

struct TextFieldValidate: View {
    @Binding var field: String
    var textLimit: Int
    var placeholder: String = ""
    
    var body: some View {
        TextField(placeholder, text: $field)
            .onReceive(Just(field)) { _ in limitText(field, textLimit) }
    }
    
    //limits the length of a text field and only takes numbers
    func limitText(_ field: String, _ upper: Int) {
        let filtered = field.filter { "0123456789".contains($0) }
        if filtered != field {
            self.field = filtered
        }
        if field.count > upper {
            self.field = String(field.prefix(upper))
        }
    }
}

struct TextFieldValidate_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldValidate(field: .constant(""), textLimit: 0)
    }
}
