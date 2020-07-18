//
//  CategoryViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class DocListViewModel: ObservableObject {
    var docs = [DocViewModel]()
    
    init() {
        fetchDocs()
    }
    
    func fetchDocs() {
        KappService().getAllDocs{ docs in
            if let docs = docs {
                self.docs = docs.map(DocViewModel.init)
            }
        }
    }
}

class DocViewModel {
    
    let id = UUID()
    
    var doc: Doc
    
    init(doc: Doc){
        self.doc = doc
    }
    
    var name: String {
        return self.doc.name
    }
    
    var description: String {
        return self.doc.description
    }
}
