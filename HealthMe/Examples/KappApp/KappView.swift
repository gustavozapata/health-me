//
//  KappView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct KappView: View {
    
    @ObservedObject private var docList = DocListViewModel()
    
    var body: some View {
        DocListView(docs: self.docList.docs)
    }
}

struct KappView_Previews: PreviewProvider {
    static var previews: some View {
        KappView()
    }
}
