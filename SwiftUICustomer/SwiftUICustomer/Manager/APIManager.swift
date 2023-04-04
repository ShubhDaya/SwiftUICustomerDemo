//
//  APIManager.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.

import Foundation
import Alamofire


class APIManager: ObservableObject {
    static func getUnauthenticatedHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        return headers
    }
    
    static func getHeaders() -> HTTPHeaders {
        var APIToken = ""
        
        if  AppState.shared.isGuestUser == true {
      //  if let user = AppState.shared.loggedUser, let userAPIToken = user. {
            APIToken = AppState.shared.GuestaccessToken
        }else {
           // APIToken = AppState.shared.userInfo.accessToken
            
            if let obj = AppState.shared.userInfo{
                APIToken = obj.accessToken
            }

        }
        
        let headers: HTTPHeaders = [
            "Authorization": APIToken,
          //  "Authorization": "Bearer " + APIToken,
            "Accept": "application/json"
        ]
        print("Header - \(headers)")
        return headers
    }
}



