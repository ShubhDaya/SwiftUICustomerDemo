//
//  FavoritesScreen.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 07/03/23.
//

import SwiftUI

struct FavoritesScreen: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Favorites")
                    .font(.system(size: 20,weight: .semibold))
                Spacer()
            }
            .frame(height: 20)
            .padding(60)
            
            Spacer()
            
            Image("emptyFav")
                .frame(width: UIScreen.screenWidth / 4,height: UIScreen.screenWidth / 4)
            
            Spacer()

            
            Text("No Favorite Restaurants")
                .font(.system(size: 18,weight: .semibold))
                .foregroundColor(.black)
                .padding(.top, 30)

            
            Text("Explore Restaurants")
                .font(.system(size: 14,weight: .bold))
                .foregroundColor(.red)
                .padding(.top, 30)
            
            Spacer()

        }
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
