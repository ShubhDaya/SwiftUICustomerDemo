//
//  CategoriesList.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 24/02/23.
//

import SwiftUI
import SDWebImage


struct CategoriesList: View {
    
    @StateObject var viewModel = HomeViewModel()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
  
    
    var body: some View {
            
            List(viewModel.arrCategory) { user in
                      
                MyListCell(data: user)
                .navigationBarTitle("Categories", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    
                                        Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image("BackIcon")
                            .aspectRatio(contentMode: .fit)
                    }
                    .foregroundColor(.blue)
                }.padding(7))
                     
        }
            .listStyle(.plain)
            .navigationBarBackButtonHidden(true)
            .onAppear{
               // viewModel.callCategoriesApi()
                viewModel.callCategoriesApi()
              //  viewModel.callCategoriesApi2()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.bottom)

    }
}
struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
    }
}


struct BackButton: View {
   @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("BackIcon")
                    .aspectRatio(contentMode: .fit)
            }
            .foregroundColor(.blue)
        }.padding(7)
    }
}
    struct MyListCell: View {
        let data: Category
        
        var body: some View {
            HStack {
                let url = URL(string: data.imageS3)
                
                AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 35, height: 35)
                    .background(Color.white)
                    
                    //.clipShape(Circle())
                
               

                Text(data.name).padding(.leading,10)
                Spacer()
            }.padding(10)
        }
    }
    struct DetailView: View {
        let data: Category
        
        var body: some View {
            VStack {
                

                AsyncImage(url: URL(string: data.imageS3), scale: 2) // 1
                    .frame(width: 60, height: 60)

                Text(data.name)
                    .font(.title)
                    .padding()
            }
        }
    }
 
