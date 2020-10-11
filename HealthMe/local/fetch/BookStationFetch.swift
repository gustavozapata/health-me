//
//  BookStationFetch.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookStationFetch: View {
    
    @State var stationId = -1
    @State var results = [Estacion]()
    
    var body: some View {
        ScrollView {
            
            VStack {
                Header(title: "Blood Stations", subtitle: "Choose one")
            }
            
            ForEach(results, id: \.self){ station in
                BloodStationRowFetch(bloodStation: station, selectedStation: self.$stationId)
            }
            
        }.onAppear(perform: loadData)
            .navigationBarTitle("Book Blood Test")
    }
    
    func loadData() {
        print("fetching data...")
        if let url = URL(string: "\(LocalVars.externalHost)/api/v1/stations") {
            if let data = try? Data(contentsOf: url){
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    results = decodedResponse.data
                }
            }
        }
    }
    
    func loadData2() {
        guard let url = URL(string: "\(LocalVars.externalHost)/api/v1/stations") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            // step 4
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.data
                    }
                    // everything is good, so we can exit
                    return
                }
            }
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "desconocido error mijo")")
        }.resume()
    }
}

struct BloodStationRowFetch: View {
    
    var bloodStation: Estacion
    
    @Binding var selectedStation: Int
    @State var showMap = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(bloodStation.location!).fontWeight(.bold)
                    Text(bloodStation.address!).fontWeight(.medium)
                    Text(bloodStation.postcode!).fontWeight(.medium)
                }
                Spacer()
                VStack {
                    Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                    Button(action: {
                        self.showMap.toggle()
                    }) {
                        Text("See map").font(.system(size: 14)).underline().foregroundColor(Color.primary)
                    }.sheet(isPresented: $showMap){
                        MapView()
                    }
                    
                    Spacer()
                    HStack(alignment: .center, spacing: 3) {
                        Image("phone_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 15)
                        Text("\(bloodStation.telephone!)").font(.system(size: 13)).underline()
                    }
                }.frame(width: 110,height: 100)
            }.padding().frame(width: 320).background(Color.white)
                .cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10)
        }
    }
}

struct BookStationFetch_Previews: PreviewProvider {
    static var previews: some View {
        BookStationFetch()
    }
}
