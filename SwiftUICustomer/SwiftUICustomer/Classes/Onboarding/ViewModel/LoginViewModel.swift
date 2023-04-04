//
//  LoginViewModel.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import Foundation
import SwiftUI
import UIKit
import Alamofire


// ViewModel for the LoginView
class LoginViewModel: ObservableObject {
    @StateObject var viewModel = UserStateViewModel()

    @Published var email = "customer@yopmail.com"
    @Published var password = "Abc@1234"
    @Published var showAlert = false
    @Published var errorMessage = ""

    func login() {
        
        AppState.shared.isGuestUser = true
        
        if self.email == ""  {
            self.showAlert = true
            self.errorMessage = "Please enter email"
            return
            // Perform login action
        }else if !isValidEmail(self.email)  {
            self.showAlert = true
            self.errorMessage = "Please enter valid email"
            return
            // Perform login action
        } else if self.password == ""  {
            self.showAlert = true
            self.errorMessage = "please enter password"
            return
            // Perform login action
        }else {
            signIn(strEmail: email, strPassword:password)
            self.errorMessage = ""
            self.showAlert = false
        }
    }
    
    
    
    // MARK: - Public APIs
    func signIn(strEmail : String, strPassword : String) {
        
        let parameters: [String: Any] = [
         "input_field": strEmail,
         "password": strPassword,
         "token" : AppState.shared.GuestaccessToken,
         "user_type": 1,
         "device_id": identifier!,
         "device_token": "cjiFKbGJLUQIrMP-SaQhFc:APA91bG_u1-A-ENCulzc5UR2BjB-e17iToBQw8aS0aHGoP3LYfIz_qUL8vPWfHLUVOo8ER_iTstsRu3iEeE-GBftNgmiG7hSO7AmyB3CEKyguluLKz-7uRewZAcpcQ0NJwkSsGdUllee",
         "device_type": "ios"
         ]
        
        print("Sign in param - \(parameters)")
        print("url - \(base_url + "/auth/login")")
 
        AF.request(base_url + "/auth/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: APIManager.getHeaders()).validate(statusCode: 200 ..< 299).responseData { response in

            
            switch response.result {
                   case .success(let data):

                           if let jsonData = response.data {
                               do {
                                   let parsedData = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
                                   print(parsedData)
                                   
                                   if let dictResponse = parsedData as? [String: Any] {
                                       if getStringValue(dictResponse , "status").uppercased() == Constant.SUCCESS {
                                           
                                           if let dictResponse1 = parsedData["data"] as? [String: Any] {
                                               AppState.shared.userInfo = UserInfo(dict: dictResponse1)
                                               saveToUserDefault(keyUserInfo, AppState.shared.userInfo!)
                                               AppState.shared.login(AppState.shared.userInfo)
                                               AppState.shared.isGuestUser =  false 
                                           }
                                       } else {
                                           self.showAlert = true
                                           self.errorMessage = getStringValue(dictResponse, "message")
                                         }
                                   }
                                   // Use the parsed data here to populate your SwiftUI views
                               } catch {
                                   print(error)
                               }
                           }
    
                   case .failure(let error):
                       print(error)
               }
           }

    }
    
    func GuestToken() {
        
        let parameters: [String: Any] = [:]
        let url = servicesAction.guestToken
        AF.request(base_url + url,
                   method: .get,
                   parameters: parameters,
                   headers: APIManager.getUnauthenticatedHeaders())
        .responseDecodable(of: GuestData.self) { response in
            
            Globals.print(response)
            
            guard let userData = response.value else {
                return
            }
            
            if let errors = userData.errors {
                //authenticationForm.updateErrors(errors: errors)
                return
            }
            
            if let user = userData.user {
                //  AppState.shared.login(user)
                print(user.isSocialLogin)
                
                AppState.shared.GuestaccessToken = user.accessToken
                print(AppState.shared.GuestaccessToken)
                
            }
        }
    }
    
}
