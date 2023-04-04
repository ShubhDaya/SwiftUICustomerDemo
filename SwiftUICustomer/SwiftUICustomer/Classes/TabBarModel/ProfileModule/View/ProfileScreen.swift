//
//  ProfileScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 06/03/23.
//

import SwiftUI

struct ProfileScreen: View {
    @State var stackHeight : CGFloat = 0
    let alignment = Alignment(horizontal: .center, vertical: .center)
    
    var arrProfileOptions = ["My Orders","Payments","Manage Address","Change Password","Contact Us","Privacy Policy","Logout"]
    
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    HStack{
                        NavigationLink {
                           Text("Edit profile")
                        } label: {
                            Spacer()
                            Text("Edit")
                                .foregroundColor(.white)
                                .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 16,weight: .semibold))
                            Image("editPencil")
                                .frame(width: AppState.shared.DeviceTypeIntreface == .pad ? 50 : 25,height:  AppState.shared.DeviceTypeIntreface == .pad ? 50 : 25)
                        }
                        
                    }.frame(width: deviceWidth,height: 50)
                    .offset(y: AppState.shared.DeviceTypeIntreface == .pad ? -20 : -10)
                    .padding(.trailing,20)

                }
                
            }
            .frame(width: deviceWidth, height: AppState.shared.DeviceTypeIntreface == .pad ? 200 : 30)
            .background(Color(0xFF0012))
            
            
            let url = URL(string: AppState.shared.userInfo.image)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 7)
            } placeholder: {
                ProgressView()
            }
            .frame(width: AppState.shared.DeviceTypeIntreface == .pad ? 300 : 150, height: AppState.shared.DeviceTypeIntreface == .pad ? 300 : 150)
            .offset(y: AppState.shared.DeviceTypeIntreface == .pad ? -150 : -80)
            .padding(.bottom, AppState.shared.DeviceTypeIntreface == .pad ? -150 : -80)
            
            VStack{
                Text(AppState.shared.userInfo.name)
                    .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 25 : 17,weight: .semibold))
                    .foregroundColor(.black)
                Text(AppState.shared.userInfo.email)
                    .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 20 : 13,weight: .semibold))
                    .foregroundColor(.gray)
                    .accentColor(.gray)
                    .frame(height:AppState.shared.DeviceTypeIntreface == .pad ? 30 : 15)
                
                Text(AppState.shared.userInfo.mobile_number)
                    .frame(height: 15)
                    .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 20 : 17,weight: .semibold))
                    .foregroundColor(.gray)
                Text(AppState.shared.userInfo.address)
                    .padding(.top,2)
                    .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 25 : 17,weight: .semibold))
                    .foregroundColor(.black)
            }
            .frame(width: deviceWidth, height: AppState.shared.DeviceTypeIntreface == .pad ? 100 : 80)
            
            Divider()
                .padding(.top,20)
            
            List {
                ForEach(arrProfileOptions, id: \.self) { item in
                    
                    Button{
                        if item == "Logout"{
                            AppState.shared.isGuestUser = true
                            AppState.shared.logout()
                        }

                        
                    } label: {
                        VStack(alignment: .leading){
                            Text(item)
                                .font(.system(size:AppState.shared.DeviceTypeIntreface == .pad ? 30 : 19,weight: .semibold))
                                .foregroundColor(.black)
                            Divider()
                                .padding(.top,10)
                        }
                    }
                    
                    .buttonStyle(PlainButtonStyle())
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.white)
                }
                .frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 80 : 50) // Set the height of each row to 50 points
            }
            .listRowBackground(Color.white) // Set the background color of each row
            .listRowInsets(EdgeInsets()) // Remove the default insets around each row
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity) // Fill the available space
            .background(Color.white) // Set the background color of the list
            .listStyle(PlainListStyle())
            .padding(.leading,AppState.shared.DeviceTypeIntreface == .pad ? 30 : 5)
            .padding(.trailing,AppState.shared.DeviceTypeIntreface == .pad ? 30 : 5)

            Spacer()
        }
        .navigationBarHidden(true)
    }
}


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}






//                        switch item {
//                        case "My Orders":
//                              Text("My Orders")
//
//                        case "Payments":
//                                Text("Payments")
//                        case "Manage Address":
//                                Text("Manage Address")
//                        case "Change Password":
//                                Text("Change Password")
//                        case "Contact Us":
//                                Text("Contact Us")
//                        case "Privacy Policy":
//                                Text("Privacy Policy")
//
//                        default:
//                                Text("Hello!")
//                        }
