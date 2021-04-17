//
//  Loading.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 17/04/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct Loading: View {
    @State var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.6)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 55, height: 50)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }.padding(.top, 150)
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
