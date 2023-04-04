//
//  ForgotPasswordViewModel.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import Foundation
import SwiftUI
import UIKit
import Alamofire


// ViewModel for the LoginView
class ForgotPasswordViewModel: ObservableObject {
  
    @Published var email = ""
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    
    func checkValidation() {
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
        } else {
            ForgotPassword(strEmail: email)
            self.errorMessage = ""
            self.showAlert = false
        }
    }
    
    // MARK: - Public APIs
    func ForgotPassword(strEmail : String) {
        
        let parameters: [String: Any] = [
         "email": strEmail,
         "user_type": 1,
         "web": false
         ]
        let url = base_url + servicesAction.forgetPassword
        
        print("Forgot in param - \(parameters)")
        print(url)
 
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: APIManager.getHeaders()).responseData { response in

            
            switch response.result {
                   case .success(let data):

                           if let jsonData = response.data {
                               do {
                                   let parsedData = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
                                   print(parsedData)
                                   
                                   if let dictResponse = parsedData as? [String: Any] {
                                       if getStringValue(dictResponse , "status").uppercased() == Constant.SUCCESS {
                                           
                                           if let dictResponse1 = parsedData["data"] as? [String: Any] {
                                               if dictResponse1["link"] != nil {
                                                   //self.moveToEmailSend()
                                                   self.showAlert = true
                                                   self.errorMessage = getStringValue(dictResponse, "message")

                                               }else{
                                                   self.showAlert = true
                                                   self.errorMessage = getStringValue(dictResponse, "message")
                                               }
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
}
