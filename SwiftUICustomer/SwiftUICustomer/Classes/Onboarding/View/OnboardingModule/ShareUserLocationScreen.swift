//
//  ShareUserLocationScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 17/02/23.
//

import SwiftUI

struct ShareUserLocationScreen: View {
    @ObservedObject var viewModel: AllowUserLocationVwModel

    @State var openPlacePicker = false

    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Spacer()
                    Image("logoName")
                        .resizable()
                        .padding(.top, 30)
                        .frame(width: 180, height: 75)
                        .padding(20)
                    Spacer()
                }
                Text("Share Location")
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                    .padding(.bottom,10)
                
                if #available(iOS 16.0, *) {
                    Text("We make it simple for you to find the local fevorites you're craving,just punch in your address to et started.")
                        .foregroundColor(.gray)
                        .frame(alignment: .center)
                        .frame(width: deviceWidth * 0.7)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,10)
                } else {
                    // Fallback on earlier versions
                }
                
                Image("locationimage")
                    .frame(width: deviceWidth * 0.5,height: deviceWidth * 0.5)
                   // .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                   // .clipped()
                    .padding(20)
                
                HStack{
                    
                    Button {
                        viewModel.getCurrentLocation()
                    } label: {
                            Text("Current Location")
                                .frame(width: deviceWidth * 0.6,height: 20)
                                .foregroundColor(.white)
                                .font(.system(size: 20,weight: .bold))

                      
                    }
                    .padding(20)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
//                    NavigationLink {
//
//                        CustomTabBar()
//
//                    } label: {
//                        if #available(iOS 16.0, *) {
//                            Text("Current Location")
//                                .frame(width: deviceWidth * 0.6,height: 20)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .font(.system(size: 20))
//                        } else {
//                            // Fallback on earlier versions
//                        }
//                    }                    .padding(20)
//                        .foregroundColor(.white)
//                        .background(Color.red)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
                
                }.padding(.top,10)
                    .frame(width: deviceWidth * 0.8,height: AppState.shared.DeviceTypeIntreface == .pad ? 80 : 60)

                Button {
                    openPlacePicker.toggle()

                  //  AddLocation(searchLocation: "")
                } label: {
                    Text("Enter Address")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .font(.system(size: 19))
                }.frame(height: 20)
                    .padding(20)
                
                Divider().frame(width: deviceWidth * 0.8)
               
            }
        }    .navigationBarBackButtonHidden(true)
            .fullScreenCover(isPresented: $openPlacePicker, content: {
                AddLocation(searchLocation: "")

            })
//            .sheet(isPresented: $openPlacePicker) {
//                AddLocation(searchLocation: "")
//            }
    }
}

struct ShareUserLocationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShareUserLocationScreen(viewModel: AllowUserLocationVwModel())
    }
}
