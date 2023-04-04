//
//  SwiftUICustomerApp.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 16/02/23.
//

import SwiftUI

@main
struct SwiftUICustomerApp: App {
    
    @StateObject var state = AppState.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
         //   tabBaeOne()
         // HomeScreen(searchText: "")
          //  CategoriesList()
           // AddLocation(searchLocation: "")
            ContentView(selectedIndex: .constant(0), isShowSignIN: false)
                .environmentObject(state)
        }
    }
}
