//
//  SearchBar.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 30/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 5))
            TextField("Search by town or postcode", text: $account.searchTerm).foregroundColor(Color.primary).padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20))
            Spacer()
        }.foregroundColor(Color.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(50).padding(.horizontal, 25)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
