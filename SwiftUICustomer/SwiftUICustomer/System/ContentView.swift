//
//  ContentView.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: AppState
    @StateObject var viewModel1 = LoginViewModel()

    @Binding var selectedIndex: Int
    @State var isShowSignIN: Bool = true

    var body: some View {
        GeometryReader { geo in
            
            NavigationView{
                
                if state.loggedIn {
                    TabBarCustom()
                }
                else if state.isGuestLogin{
                    TabBarCustom()
                }
                else {
                    
                    VStack {
                        ZStack{
                            HStack{
                                Spacer()
                                Image("logoName")
                                    .resizable()
                                    .padding(.top, 0)
                                    .frame(width: AppState.shared.DeviceTypeIntreface == .pad ? 400 : 200,height: AppState.shared.DeviceTypeIntreface == .pad ? 80 : 50)
                                Spacer()
                                
                            }.padding(.bottom,30)
                            VStack{
                                HStack{
                                    Spacer()
                                    NavigationLink(destination: ShareUserLocationScreen(viewModel: AllowUserLocationVwModel())) {
                                        Text("Skip").fontWeight(.medium).font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 17))
                                            .foregroundColor(.gray)
                                    }.padding(.trailing, 20)
                                }.frame(height: 25)
                                    .padding(.bottom, 90)
                            }
                        }.frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 200 : 100)
                        
                        SegmentButton(selectedIndex: selectedIndex, isShowSignIN: $isShowSignIN)
                        
                        if isShowSignIN {
                            LoginScreen()
                        }else{
                            SignUpScreen(viewModel: SignUpViewModel())
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(.stack)
            
            .onAppear{
                selectedIndex = 0
                isShowSignIN = true
                viewModel1.GuestToken()

               // AppState.shared.isGuestUser = true

            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedIndex: .constant(0), isShowSignIN: true)
    }
}

struct SegmentButton: View {

    @State var selectedIndex: Int = 0
    @Binding var isShowSignIN: Bool


    var body: some View {
            HStack{
                Button {
                    selectedIndex = 0
                    isShowSignIN = true
                    print(selectedIndex)
                    
                } label: {
                    VStack{
                        Text("Sign In")
                            .fontWeight(.bold)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 30 : 18))
                        Rectangle()
                            .fill( selectedIndex == 0 ? Color.red : Color.gray)
                            .frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 5 : 2)
                    }
                }.foregroundColor( selectedIndex == 0 ? .red : Color.gray)
                
                
                Button {
                    selectedIndex = 1
                    print(selectedIndex)
                    isShowSignIN = false
                    
                } label: {
                    VStack{
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 30 : 18))
                        Rectangle()
                            .fill( selectedIndex == 0 ? Color.gray : Color.red)
                            .frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 5 : 2)
                    }
                }.foregroundColor(selectedIndex == 0 ? Color.gray : Color.red)
                
            }
            .frame(maxWidth: .infinity)
    }
}
