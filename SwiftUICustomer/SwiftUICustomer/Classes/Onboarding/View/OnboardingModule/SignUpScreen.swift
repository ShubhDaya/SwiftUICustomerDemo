//
//  SignUpScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 16/02/23.
//

import SwiftUI

struct SignUpScreen: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack{
                        Spacer()
                        Text("SIGN UP")
                            .foregroundColor(.black)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 45 : 30))
                            .fontWeight(.bold)
                            .frame(height:  AppState.shared.DeviceTypeIntreface == .pad ? 70 : 35)
                            .padding(20)
                        Text("Create your account")
                            .foregroundColor(.gray)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 35 : 23))
                            .fontWeight(.medium)
                            .frame(height: AppState.shared.DeviceTypeIntreface == .pad ? 50 : 20)
                        Spacer()
                        
                    }
                    
                }.padding(20)
                CommonTextField(placeholder: "First Name", text: $viewModel.userFirstName)
                CommonTextField(placeholder: "Last Name", text: $viewModel.lastName)
                CommonTextField(placeholder: "Email", text: $viewModel.email)
                CommonTextField(placeholder: "Contact Number", text: $viewModel.contactNumber)
                CommonTextField(placeholder: "Password", text: $viewModel.password)
                CommonTextField(placeholder: "Cofirm Password", text: $viewModel.confirmPassword)
                
                HStack{
                    Button {
                    } label: {
                        Image(systemName: "checkmark.square")
                            .frame(width:  AppState.shared.DeviceTypeIntreface == .pad ? 50 : 20, height:  AppState.shared.DeviceTypeIntreface == .pad ? 50 : 20)
                    }.padding(.leading,  AppState.shared.DeviceTypeIntreface == .pad ? 40 : 30)
                    Text("I accept")
                        .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 16))
                    Button {
                        
                    } label: {
                        Text("Terms & Codition")
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 16))
                    }
                    Spacer()
                    
                }
                
                
                HStack{
                    Button(action: {viewModel.isFormValid()}) {
                            Text("Sign In")
                                .frame(width: deviceWidth * 0.8,height: AppState.shared.DeviceTypeIntreface == .pad ? 50 : 20)
                                .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad  ? 40 : 25,weight: .bold))
                                .foregroundColor(.white)

                      
                    }
                    .padding(20)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(width: deviceWidth * 0.8,height: AppState.shared.DeviceTypeIntreface == .pad ? 70 : 55)
                }.padding(40)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(viewModel: SignUpViewModel())
    }
}
