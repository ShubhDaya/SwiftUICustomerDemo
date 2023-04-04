//
//  demoPlace.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 24/02/23.
//

import SwiftUI
import GooglePlaces
import Foundation
import UIKit
import SwiftUI
import GooglePlaces


struct demoPlace: View {
    
    @State var openPlacePicker = false
    @State var address = ""
    @State var placesClient: GMSPlacesClient!
    @State var selectedPlace: GMSPlace?

    
    var body: some View {
        
        VStack {
                  // Text("Selected place: \(selectedPlace?.name ?? "")")
               }
        
        VStack {

            Text(address)

            Button {

                openPlacePicker.toggle()
            } label: {

                Text("open place picker")
            }

        }.sheet(isPresented: $openPlacePicker) {
            PlacePicker(selectedPlace: $selectedPlace)
            .onAppear{
                placesClient = GMSPlacesClient.shared()
            }
        }
    }
}

struct demoPlace_Previews: PreviewProvider {
    static var previews: some View {
        demoPlace()
    }
}




