//
//  AppDelegate.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.
//

import Foundation
import UIKit
import SwiftUI
import GoogleMaps
import GooglePlaces

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Did finish launch ")
        UITableView.appearance().separatorStyle = .none
        
        var obj = getFromUserDefaults(keyUserInfo)
        if obj == nil{
            AppState.shared.userInfo = nil
            AppState.shared.isGuestUser = false
        }else{
            AppState.shared.login((obj as? UserInfo)!)
            AppState.shared.userInfo = obj as! UserInfo

        }

        googlePalceApi()
        return true
    }
    
    func googlePalceApi() {
        
        GMSPlacesClient.provideAPIKey(feasterly_google_map_key)
         GMSServices.provideAPIKey(feasterly_google_map_key)

     //   GMSPlacesClient.provideAPIKey(feasterly_google_map_key)
      //  GMSServices.provideAPIKey(feasterly_google_map_key)
    }
}
