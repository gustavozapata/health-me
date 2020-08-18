//
//  PageView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import UIKit

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]){
        self.viewControllers = views.map{UIHostingController(rootView: $0)}
    }
    
    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView([Image("nobookings"), Image("discover01")])
    }
}
