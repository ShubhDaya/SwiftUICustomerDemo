//
//  TabBarCustom.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import SwiftUI

struct TabBarCustom: View {
    @State var selecedIndex = 0
    @State var shouldShowModel = false
    
    let tabBarImagesNamesInactive = ["home","favourite","CartCustom","order","user"]
    let tabBarImagesNamesActive = ["home_active","favourite_active","CartCustom","order_active","user_active"]
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                ZStack{
                    
                    Spacer()
                        .fullScreenCover(isPresented: $shouldShowModel,content:  {
                            Button {
                                shouldShowModel.toggle()
                            } label: {
                                Text("Full screen")
                            }
                        })
                    
                    switch selecedIndex{
                    case 0 :
                        HomeScreen(searchText: "")
                    case 1 :
                        FavoritesScreen()
                        
                    case 2 :
                        
                        Text("ThirdView")
                        
                    case 3 :
                        //  CoffeeFeed()
                        // TodoList(picsViewModel: PicsViewModel())
                        Text("ThirdView")
                        
                    case 4 :
                        
                        ProfileScreen()
                        
//                        Button {
//                            AppState.shared.isGuestUser = true
//                            AppState.shared.logout()
//                            
//                        } label: {
//                            Text("Logout")
//                                .fontWeight(.bold)
//                                .font(.system(size: 18))
//                        }
                        
                        
                        
                    default:
                        Text("Remaining tabs")
                    }
                    
                }
                Spacer()
                
                HStack{
                    ForEach(0..<5){num in
                        Button {
                            selecedIndex = num
                            if num == 2 {
                                shouldShowModel.toggle()
                                return
                            }
                        } label: {
                            Spacer()
                            if num == 2 {
                                Image(tabBarImagesNamesInactive[num])
                                    .font(.system(size: 44,weight: .bold))
                                    .frame(width: 30,height: 30)
                                //.foregroundColor(.red)
                            }else{
                                
                                if selecedIndex == num{
                                    switch num {
                                    case 0:
                                        Image(tabBarImagesNamesActive[num])
                                            .font(.system(size: 24,weight: .bold))
                                        //  .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                    case 1:
                                        Image(tabBarImagesNamesActive[num])
                                            .font(.system(size: 24,weight: .bold))
                                        //  .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                    case 2:
                                        Image(tabBarImagesNamesActive[num])
                                            .font(.system(size: 24,weight: .bold))
                                        //  .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                    case 3:
                                        Image(tabBarImagesNamesActive[num])
                                            .font(.system(size: 24,weight: .bold))
                                        // .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                    case 4:
                                        Image(tabBarImagesNamesActive[num])
                                            .font(.system(size: 24,weight: .bold))
                                        // .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                        
                                        
                                    default:
                                        Text("Hello!")
                                    }
                                    
                                }else{
                                    Image(tabBarImagesNamesInactive[num])
                                        .font(.system(size: 24,weight: .bold))
                                        .foregroundColor(selecedIndex == num ? Color(.black) : Color(.gray))
                                }
                                
                            }
                            Spacer()
                            
                            
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
            .navigationBarHidden(true)
           // .navigationViewStyle(.stack)
            .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct TabBarCustom_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCustom()
    }
}
