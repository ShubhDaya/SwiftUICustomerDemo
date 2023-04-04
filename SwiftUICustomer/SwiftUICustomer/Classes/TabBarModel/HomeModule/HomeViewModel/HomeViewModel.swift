//
//  HomeViewModel.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 01/03/23.
//

import Foundation
import Alamofire

class HomeViewModel: ObservableObject {
    
    @Published var arrSections: [String] = []
    @Published var arrBanner : [Banner]?
    // @Published var arrCategory : [Category]?
    @Published var arrCategory = [Category]()
    @Published var arrTempCategory : [Category] = []
    @Published var inactive_records = 1
    @Published var pageCount = 1
    @Published var nextOffset = 0
    @Published var arrRestuarentList = [RestaurantList]()
    
    // @Published var arrRestaurant : [Restuarents] = []
    //  @Published var arrTempCategory : [Categories] = []
    typealias onCompletionHandler = () -> Void
    
    // MARK: - Public APIs
    
    func callCategoriesApi() {
        let url = base_url + servicesAction.baseApi + "?date=\(Date().getString(format: "yyyy-MM-dd"))"
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: APIManager.getHeaders())
        .responseDecodable(of: Response.self) { [weak self] (response) in
            Globals.print(response)
            
            switch response.result {
            case .success(let responseData):
                // Use the decoded data here
                guard let userData = response.value else {
                    return
                }
                
                if let userStats = userData.data.categories {
                    print(self?.arrCategory.count)
                    for i in userStats{
                        self?.arrCategory.append(i)
                    }
                }
                
                if let userbanner = userData.data.banners {
                    self?.arrBanner = userbanner
                }
                // For adding see all option if categories are more then 4
                self?.arrTempCategory.removeAll()
                if self?.arrCategory.count ?? 0 > 4 {
                    for i in 0..<4 {
                        self?.arrTempCategory.append((self?.arrCategory[i])!)
                    }
                    self?.arrTempCategory.append(Category.init(id: 45, name: "See All", imageS3: "", sequence: 0))
                }else{
                    for i in 0..<(self?.arrCategory.count ?? 0) {
                        self?.arrTempCategory.append(self!.arrCategory[i])
                    }
                    
                }
                print(responseData.data.categories)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
    func wsGetNearResturant() {
        
        self.arrRestuarentList.removeAll()
        let params: [String: Any] = [
        
            "address":"", //AppSharedData.shared.Currentuserlocation.adress,
            "search": "",
            "latitude": AppState.shared.Currentuserlocation.latitude,
            "longitude": AppState.shared.Currentuserlocation.longitude,
            "category_id": 0,
            "favourite": false,
            "page": self.pageCount,
            "pagination": 10,
            //"city":""  //city,
            "inactive_records": self.inactive_records,
            "nextOffset": self.nextOffset
        ]
    
        
        let url = base_url + servicesAction.near_restaurant
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: APIManager.getHeaders())
        .responseDecodable(of: RestaurantListJson.self) { [weak self] (response) in
            Globals.print(response)
            
            switch response.result {
            case .success(let responseData):
                // Use the decoded data here
                
                guard let userData = response.value else {
                    return
                }
                
                for i in userData.data.restuarents{
               
                    
                    self?.arrRestuarentList.append(i)
             
                }
                
                print("Near Restuarent count - \(self?.arrRestuarentList.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //
    //    func callCategoriesApi2() {
    //        let parameters: [String: Any] = [:]
    //
    //
    //       // AF.request(appConfiguration.APIBaseURL() + "register",
    //        print(parameters)
    //        let url = base_url + servicesAction.baseApi + "?date=\(Date().getString(format: "yyyy-MM-dd"))"
    //        print(url)
    //
    //        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: APIManager.getHeaders()).validate(statusCode: 200 ..< 600).responseData { response in
    //
    //            switch response.result {
    //                   case .success(let data):
    //
    //                if let jsonData = response.data {
    //                    do {
    //                        let parsedData = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
    //                        print(parsedData)
    //
    //                        if let dictResponse = parsedData as? [String: Any] {
    //                            if getStringValue(dictResponse , "status").uppercased() == Constant.SUCCESS {
    //
    //                                if let dictResponse1 = parsedData["data"] as? [String: Any] {
    ////                                    AppState.shared.userInfo = UserInfo(dict: dictResponse1)
    ////                                    saveToUserDefault(keyUserInfo, AppState.shared.userInfo!)
    ////
    ////                                    AppState.shared.login(AppState.shared.userInfo)
    //                                }
    //                            } else {
    //                               // self.showAlert = true
    //                           //     self.errorMessage = getStringValue(dictResponse, "message")
    //                              }
    //                        }
    //                        // Use the parsed data here to populate your SwiftUI views
    //                    } catch {
    //                        print(error)
    //                    }
    //                }
    //
    //                   case .failure(let error):
    //                       print(error)
    //               }
    //           }
    //    }
    
}
