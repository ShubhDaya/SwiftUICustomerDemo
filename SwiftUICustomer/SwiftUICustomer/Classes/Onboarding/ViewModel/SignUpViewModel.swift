//  SignUpViewModel.swift
//  SwiftUICustomer
//  Created by ADMIN on 21/02/23.


import Foundation
import Alamofire
import CoreLocation

class SignUpViewModel: ObservableObject {
    
    @Published var userFirstName = ""
    @Published var lastName = ""
    @Published var password = ""
    @Published var email = ""
    @Published var contactNumber = ""
    @Published var confirmPassword = ""
    @Published var isSignUpSuccess = false
    @Published var showAlert = false
    @Published var errorMessage = ""

        
    private func isFormValid() -> Bool {
        if userFirstName.isEmpty || lastName.isEmpty || email.isEmpty || contactNumber.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return false
        }
        if password != confirmPassword {
            return false
        }
        if !isValidEmail(email) {
            return false
        }
        return true
    }
    
    func isFormValid() {
        if self.userFirstName == ""  {
            self.showAlert = true
            self.errorMessage = "please enter first name"
            return
            // Perform login action
        } else if self.lastName == ""  {
            self.showAlert = true
            self.errorMessage = "please enter last name"
            return
            // Perform login action
        }
        else if self.email == ""  {
           self.showAlert = true
           self.errorMessage = "please enter email"
           return
           // Perform login action
       }
        else if self.contactNumber == ""  {
           self.showAlert = true
           self.errorMessage = "please enter contact number"
           return
           // Perform login action
       }
        else if self.password == ""  {
           self.showAlert = true
           self.errorMessage = "please enter password"
           return
           // Perform login action
       }  else if self.confirmPassword == ""  {
           self.showAlert = true
           self.errorMessage = "please enter password"
           return
           // Perform login action
       }else  if password != confirmPassword {
           self.showAlert = true
           self.errorMessage = "password and confirm password not match"
           return
           
       }
        
        else {
            signUp()
            self.errorMessage = ""
            self.showAlert = false
        }
    }
    
    
        func signUp() {
            
            AppState.shared.isGuestUser = true

            
            if !isFormValid() {
                return
            }
            let parameters = [
                    "name": userFirstName + lastName,
                    "first_name": userFirstName,
                    "last_name": lastName,
                    "email": email,
                    "password": password,
                    "user_type": "1",
                    "device_id": identifier!,
                    "device_token": "sdfsdfs",
                    "device_type": "ios",
                    "token" : AppState.shared.GuestaccessToken,
                    "mobile_number": contactNumber,
                    "country_code": 1
            ] as [String : Any]
            
           // AF.request(appConfiguration.APIBaseURL() + "register",
            print(parameters)
         
            AF.request(base_url + "/auth/registration", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: APIManager.getHeaders()).validate(statusCode: 200 ..< 600).responseData { response in
                
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
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
