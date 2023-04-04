//
//  ForgotPasswordScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 16/02/23.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: ForgotPasswordViewModel

    @State var Email : String

    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Image("logoName")
                    .resizable()
                    .padding(.top, 30)
                    .frame(width: 180, height: 75)
                    .padding(20)
                Spacer()
            }.padding(.bottom,20)
                .frame(height: 100)
            
            
            Text("Forgot Password")
                .fontWeight(.bold)
                .font(.system(size: 27))
            
            CommonTextField(placeholder: "Email", text: $viewModel.email)
                .padding(.top,30)
                .padding(.bottom,30)

            HStack{
                Button(action: {
                    viewModel.checkValidation()
                }) {
                        Text("Submit")
                            .frame(width: deviceWidth * 0.8,height: 20)
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                   
                    
                }
                .padding(20)
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .frame(width: deviceWidth * 0.8,height: 60)

            }.padding(20)
            
            
            Spacer()
            
            
            Divider()
                .frame(width:deviceWidth * 8 )
            
            HStack{
                Spacer()
                Text("Back to")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Button {
                    self.presentationMode.wrappedValue.dismiss()

                } label: {
                    Text("Sign In")
                        .fontWeight(.medium)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
            }.padding(40)
            
                        
            
        }
        .navigationBarHidden(true)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }

    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen(viewModel: ForgotPasswordViewModel(), Email: "")
    }
}
