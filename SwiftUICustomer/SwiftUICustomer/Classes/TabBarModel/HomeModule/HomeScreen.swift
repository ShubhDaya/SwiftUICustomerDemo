//
//  HomeScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 17/02/23.

import SwiftUI
import CoreLocation
import GooglePlaces

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State  var searchText : String
    @State  var openPlacePicker = false
    @State var selectedPlace: GMSPlace?
   
    var defaultAddress : String = "Home"
    var gridLayout: [GridItem] = [ GridItem() ]
    var selectedloaction : UserAddressNew!
    var objSeeAll: [String: Any] = ["name": "See All"]
    var TwoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    let samplePhotos = (1...20).map { Photo(name: "coffee-\($0)") }
   
    var body: some View {
            VStack{
                HeaderView(getLocationModel: AllowUserLocationVwModel(), isOpenPlace: $openPlacePicker,SelectedAddress: selectedPlace?.name ?? "")
                SearchBarView(searchText: $searchText)
                CategoryHomeView(viewModel: viewModel).padding(.top,20)
                
                VStack{
                    ScrollView {
                        LazyVGrid(columns: TwoColumnGrid, alignment: .center, spacing: 10) {
                            
                            ForEach(self.viewModel.arrRestuarentList) { category in
                                VStack{
                                   
                                        let url = URL(string: category.image)
                                        AsyncImage(url: url,scale: 2) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                            //.frame(maxWidth: 40, maxHeight: 40)
                                               // .frame(minWidth: 0, maxWidth: .infinity)
                                               // .frame(height: 120)
                                                .cornerRadius(10)
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        //  .frame(width: 45, height: 45)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 280 :  100)
                                        .background(Color.white)
                                        
                                    VStack(alignment: .leading){
                                        HStack{
                                            Text(category.name)
                                                .padding()
                                                .font(.system(size: 14,weight: .semibold))
                                            Spacer()

                                        }
                                        .frame(height:15)
                                        .padding(.top,10)

                                        HStack{
                                            
                                            Text(category.address)
                                                .padding()
                                                .lineLimit(2)
                                                .font(.system(size: 11,weight: .regular))
                                                .foregroundColor(.black)
                                            Spacer()

                                        }
                                        .frame(height:40)

                                        Spacer()

                                        }
                                        .frame(height:80)
                                    Spacer()

                                }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)

                            }
                        }
                    }
                }
                .padding(.top,25)
                .padding(.leading, AppState.shared.DeviceTypeIntreface == .pad ? 30 : 15)
                .padding(.trailing,AppState.shared.DeviceTypeIntreface == .pad ? 30 : 15)


                Spacer()
            }
           
        .navigationBarHidden(true)
        .onAppear{
            viewModel.callCategoriesApi()
            var obj = getFromUserDefaults(keyUserLocation)
            if obj == nil{
                print("Default Location not found")
            }else{
                AppState.shared.Currentuserlocation = obj as! UserAddressNew
                viewModel.wsGetNearResturant()
            }
        }.onChange(of: selectedPlace, perform: { newValue in
            viewModel.callCategoriesApi()
            var obj = getFromUserDefaults(keyUserLocation)
            if obj == nil{
                print("Default Location not found")
            }else{
                AppState.shared.Currentuserlocation = obj as! UserAddressNew
                viewModel.wsGetNearResturant()
            }
        })
        .sheet(isPresented: $openPlacePicker) {
            PlacePicker(selectedPlace: $selectedPlace)
        }
    }
    
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
     
        HomeScreen(searchText: "")
    }
}

struct HeaderView: View {
    @ObservedObject var getLocationModel: AllowUserLocationVwModel
    @Binding var isOpenPlace: Bool
    var SelectedAddress: String

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("homeLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppState.shared.DeviceTypeIntreface == .pad ? 400 : 150,height:AppState.shared.DeviceTypeIntreface == .pad ? 250 : 100)
                
                Spacer()
            }       .padding(.top,70)

                .frame(height: 80)
            
            Button {
                isOpenPlace.toggle()
                
            } label: {
                HStack{
                    Image("currentLoc")
                        .resizable()
                        .scaledToFit()
                        .frame(width: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 15,height: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 15)
                        .foregroundColor(.white)
                    
                    if AppState.shared.Currentuserlocation != nil{
                    Text("Home: \(AppState.shared.Currentuserlocation.adress)" )
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 25 : 14))
                            .lineLimit(1)


                    }else{
                        Text("Home: \(SelectedAddress ?? "")")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 25 : 14))
                            .lineLimit(1)

                    }
                    
                    Spacer()
                }.padding(.leading,AppState.shared.DeviceTypeIntreface == .pad ? 35 :  18)
                    .frame(height: 100)
            }
                .padding(.bottom,AppState.shared.DeviceTypeIntreface == .pad ? 40 : 90)
            Spacer()
            
        }.frame(width: deviceWidth, height: AppState.shared.DeviceTypeIntreface == .pad ? 200 : 80)
            .background(Color(0xFF0012))
            .navigationBarHidden(true)
    }
}
struct ImageDetailsView: View {
    let imageName: String
    
    var body: some View {
        let url = URL(string: imageName)
        AsyncImage(url: url) { image in
            image
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .navigationBarTitle(Text(imageName), displayMode: .inline)
        } placeholder: {
            ProgressView()
        }
        
        
    }
}

struct SearchBarView: View {
    @Binding  var searchText : String

    var body: some View {
        VStack{
            HStack{
                TextField("Find a food or restaurant", text: $searchText)
                    .foregroundColor(.gray)
                    .padding(10)
                Spacer()
            }
            
        }.frame(width: deviceWidth * 0.91,height: AppState.shared.DeviceTypeIntreface == .pad ? 80 : 50)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, -30)
        //  .clipped()
            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
    }
}

struct CategoryHomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            GeometryReader { geo in
                
                HStack() {
                    ForEach(self.viewModel.arrTempCategory) { category in
                        
                        NavigationLink {
                            if category.name == "See All"{
                                CategoriesList()
                            }else{
                                ImageDetailsView(imageName: category.imageS3)
                            }
                            
                        } label: {
                            VStack{
                                VStack{
                                    let url = URL(string: category.imageS3)
                                    if category.name == "See All"{
                                       
                                        VStack(alignment: .center){
                                            Text("See All  ").foregroundColor(Color(0xFF0012))
                                                .fontWeight(.bold)
                                              .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 15))
                                        }
                                       // .frame(width: 45, height: 50)
                                        .frame(width:deviceWidth / 9  , height: deviceWidth / 9 )
                                        
                                    }else{
                                        
                                        AsyncImage(url: url,scale: 2) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                //.frame(maxWidth: 40, maxHeight: 40)
                                                .frame(width:deviceWidth / 12  , height: deviceWidth / 12 )
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                          //  .frame(width: 45, height: 45)
                                        .frame(width:deviceWidth / 10  , height: deviceWidth / 10 )

                                        .background(Color.white)
                                    }
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.red.opacity(0.2), radius: 5, x: 3, y: 3)
                             //   .frame(width:50, height: 50)
                                .frame(width:deviceWidth / 11  , height: deviceWidth / 11 )

                                if category.name == "See All"{
                                    Text(" ")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 10))
                                }else{
                                    Text(category.name)
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 10))
                                }
                                
                            }
                          //  .frame(width:60, height: 70)
                            .frame(width:deviceWidth / 11  , height: deviceWidth / 8 )
                            .padding()

                        }
                        //.frame(width:70, height: 80)
                       // .frame(width:deviceWidth / 5 , height: deviceWidth / 5 )

                    }
                }
                .padding(.leading,AppState.shared.DeviceTypeIntreface == .pad ? 40 : 0)
                .padding(.trailing,AppState.shared.DeviceTypeIntreface == .pad ? 40 : 0)
            }
        }
        
        .frame(
            minWidth: deviceWidth * 0.95,
            maxWidth: deviceWidth * 0.95,
            minHeight: deviceWidth / 5,
            maxHeight: deviceWidth / 5,
            alignment: .center
        )
    }
}
