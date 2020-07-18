//
//  DocListView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DocListView: View {
    var docs: [DocViewModel]
    
    init(docs: [DocViewModel]){
        self.docs = docs
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(self.docs, id:\.id){doc in
                    Text(doc.name).padding()
                }
            }
        }
    }
}

struct DocListView_Previews: PreviewProvider {
    static var previews: some View {
        DocListView(docs: [DocViewModel]())
    }
}
