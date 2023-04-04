//
//  LoginScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 16/02/23.
//

import SwiftUI

var deviceWidth: CGFloat {
    UIScreen.main.bounds.width
}
var deviceHeight: CGFloat {
    UIScreen.main.bounds.height
}

struct LoginScreen: View {
    @StateObject var viewModel1 = LoginViewModel()
    @StateObject var viewModel = UserStateViewModel()

    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Spacer()
                    Image("logoName")
                        .resizable()
                        .padding(.top, AppState.shared.DeviceTypeIntreface == .pad
                                 ? 60 : 30)
                        .frame(width: AppState.shared.DeviceTypeIntreface == .pad
                               ? 300 : 150, height: AppState.shared.DeviceTypeIntreface == .pad
                               ? 120 : 75)
                        .padding(20)
                    Spacer()
                }.padding(.bottom,20)
                    .frame(height: 100)
                
                Text("SIGN IN")
                    .foregroundColor(.black)
                    .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad
                                  ? 40 : 30))
                    .fontWeight(.bold)
                    .frame(height: AppState.shared.DeviceTypeIntreface == .pad
                           ? 70 : 50)
                
                CommonTextField(placeholder: "Email", text: $viewModel1.email)
                CommonTextField(placeholder: "Password", text: $viewModel1.password)

                
                HStack{
                    Spacer()
                    NavigationLink {
                        ForgotPasswordScreen(viewModel: ForgotPasswordViewModel(), Email: "")
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(.red)
                            .font(.system(size: AppState.shared.DeviceTypeIntreface == .pad ? 25 : 20))
                            .fontWeight(.bold)
                    }
                }.padding(.trailing, 40)
                
                HStack{
                    Button(action: {
                        viewModel1.login()
                    }) {
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
                
                
                Spacer()
            }
        }.onAppear{
            viewModel1.GuestToken()
        }
        .alert(isPresented: $viewModel1.showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(viewModel1.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}

struct CommonTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .textFieldStyle(OutlinedTextFieldStyle())
            .frame(width: deviceWidth * 0.9,height: 25)
            .padding(.top, 25)
            .textInputAutocapitalization(.none)
            .autocapitalization(.none)

            .textCase(.lowercase)
            .padding(.bottom,30)
    }
}



