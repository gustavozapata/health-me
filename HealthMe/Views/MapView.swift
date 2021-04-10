//
//  MapView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
struct MapView: View {
    
    @ObservedObject var account: AccountViewModel = .account
    
    let places = [Place(name: "Kingston Blood Station", latitude: 51.4154248, longitude: -0.3041535)]
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.4154248, longitude: -0.3041535),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var body: some View {
        VStack {
            HStack{
                Text("Pull down to close").font(.system(size: 13, weight: .semibold)).padding(.top)
            }
            Map(coordinateRegion: $region, annotationItems: places) { place in
                MapPin(coordinate: place.coordinate)
            }
        }.preferredColorScheme(account.isDark ? .dark : .light)
        .ignoresSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
