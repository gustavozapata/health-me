//
//  Model_Profile.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//
import SwiftUI

//MODEL
struct Profile {
    let id: Int
    let name: String
    let description: String
    let isRead: Bool
}
extension Profile: Hashable {
    static func all() -> [Profile] {
        return [
            Profile(id: 1, name: "Account", description: "Profile, privacy", isRead: false),
            Profile(id: 2, name: "Settings", description: "Themes, encryption", isRead: true),
            Profile(id: 3, name: "Privacy", description: "Shared info, blocked contacts, extras", isRead: true)
        ]
    }
}

//VIEW
struct View_Profile: View {
    @State var isList = true
    @State var isRead = false
    let profiles = Profile.all()
    
    init() {
        //UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    ZStack {
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        Rectangle().fill(Color.green).frame(width: 20, height: 20).offset(x:10)
                    }
                    Toggle(isOn: $isRead) {
                        Text("Read")
                    }.frame(width: 100, height: 20)
                    Spacer()
                    Image(systemName: "list.dash").onTapGesture {
                        self.isList.toggle()
                    }
                    Button(action: {
                        self.isList.toggle()
                    }) {
                        Text("Change")
                    }
                    
                }.padding(.all)
                List(self.profiles.chunks(size: isList ? 1 : 2), id: \.self){ chunk in
                    ForEach(chunk.filter{ $0.isRead == self.isRead}, id: \.self){profile in
                        NavigationLink(destination: ProfileDetail(profile: profile)){
                            ProfileCell(profile: profile)
                        }
                    }
                }
            }
            .navigationBarTitle("Profile")
        }
    }
}
struct Model_Profile_Previews: PreviewProvider {
    static var previews: some View {
        View_Profile()
    }
}
struct ProfileCell: View {
    let profile: Profile
    
    var body: some View {
        HStack {
            if(profile.isRead){
                Circle().fill(Color.green).frame(width: 10, height:10)
            }
            Image(profile.name.lowercased()).resizable().frame(width: 50, height: 50).cornerRadius(16)
            VStack(alignment: .leading) {
                
                Text(profile.name)
                Text(profile.description)
            }
        }
    }
}

struct ProfileDetail: View {
    let profile: Profile
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack{
            Image(profile.name.lowercased()).resizable().aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation{
                        self.zoomed.toggle()
                    }
            }
            Text(profile.description)
                .navigationBarTitle(Text(profile.name), displayMode: .inline)
        }
    }
}

extension Array {
    func chunks(size: Int) -> [ArraySlice<Element>]{
        var chunks: [ArraySlice<Element>] = [ArraySlice<Element>]()
        
        for index in stride(from: 0, to: self.count - 1, by: size){
            var chunk = ArraySlice<Element>()
            let end = index + size
            if end >= self.count {
                chunk = self[index..<self.count]
            } else {
                chunk = self[index..<end]
            }
            chunks.append(chunk)
            if(end + 1) == self.count {
                let remainingChunk = self[end..<self.count]
                chunks.append(remainingChunk)
            }
        }
        return chunks
    }
}
