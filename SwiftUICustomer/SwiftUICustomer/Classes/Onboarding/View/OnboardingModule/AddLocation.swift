//
//  AddLocation.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import SwiftUI
import CoreLocation
import GooglePlaces

struct AddLocation: View {
    @EnvironmentObject var state: AppState
    @Environment(\.dismiss) var dismiss
    
    let placesClient = GMSPlacesClient()
    @State var openPlacePicker = false
    @State  var searchLocation : String
    @State var selectedPlace: GMSPlace?
    var selectedloaction : UserAddressNew!
    
    var body: some View {
        VStack{
            ZStack{
                Text("Search Address")
                    .fontWeight(.semibold)
                    .font(.system(size: 22))
                    .frame(height: 30)
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image("BackIcon").frame(width: 30,height: 30)
                    }.padding(10)
                    Spacer()
                }
            }
            
            VStack{
                HStack{
                    Button {
                        openPlacePicker.toggle()
                    } label: {
                        HStack{
                            Image("search")
                                .padding(.leading,15)
                                .frame(width: 25,height: 25)
                                .padding(.leading,AppState.shared.DeviceTypeIntreface == .pad ? 25 : 5)
                            
                            Text(selectedPlace?.name ?? "Search Addresss...")
                                .font(.system(size: 17))
                                .foregroundColor(.gray)
                            //  .frame(width: deviceWidth * 0.7)
                                .frame(alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(15)
                            Spacer()
                            
                            Spacer()
                        }
                    }
                    Spacer()
                    
                }
                
            }
            .frame(height: 50)
            .padding(20)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
                    .frame(width: deviceWidth * 0.9,height: 50)
            )
            
            Spacer()
            HStack{
                Button(action: {
                    
                    if selectedPlace?.name == nil {
                    }else{
                        dismiss()
                        state.isGuestLogin = true
                    }
                    
                }) {
                    Text("Continue")
                        .frame(width: deviceWidth * 0.8,height: 20)
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                    
                }
                .padding(20)
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }.padding(40)
                .frame(width: deviceWidth * 0.8,height: AppState.shared.DeviceTypeIntreface == .pad ? 90 : 60)
            
            Spacer()
            
        }.padding(.top,5)
            .sheet(isPresented: $openPlacePicker) {
                PlacePicker(selectedPlace: $selectedPlace)
                
            }
            .onAppear{
                print(selectedPlace?.name ?? "")
            }
            .navigationBarBackButtonHidden(true)
        
    }
    
}

struct AddLocation_Previews: PreviewProvider {
    static var previews: some View {
        AddLocation(searchLocation: "")
    }
}

