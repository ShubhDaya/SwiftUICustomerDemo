//
//  tabBaeOne.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 02/03/23.
//

import SwiftUI

struct tabBaeOne: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LoginScreen()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)
            
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
    }


struct tabBaeOne_Previews: PreviewProvider {
    static var previews: some View {
        tabBaeOne()
    }
}
