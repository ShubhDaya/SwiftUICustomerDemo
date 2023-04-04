//  homeModel.swift
//  SwiftUICustomer
//  Created by ADMIN on 01/03/23.

import Foundation


struct Category: Codable,Identifiable {
   let id: Int
    let name: String
    let imageS3: String
    let sequence: Int
}

struct Banner: Codable {
    let bannerS3: String
}

struct Response: Codable {
    let data: Data2
}

struct Data2: Codable {
    let categories: [Category]?
    let banners: [Banner]?
}

struct RestaurantList: Codable, Identifiable {
    let id: Int
    let name: String
    let address: String
    let distance: Double
    let image: String
    let favourite: Int
    let owner_permission: Int
    let status: Int
    let active: Int
    let delivery_provide: Int
}


struct RestaurantListJson: Codable {
    let data: RestaurantListData
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
}



struct RestaurantListData: Codable {
    
  //  let getTimeMultiplyBY: String
    let inactive_records: Int
    let nextOffset: Int
    let restuarents: [RestaurantList]
    
//    enum CodingKeys: String, CodingKey {
//        case restuarents = "restuarents"
//    }
}


//struct CatergoriesBannerApi: Codable {
//    let user: CatergoriesBannerApiParse?
//    let message: String?
//    let errors: [String: [String]]?
//    
//    enum CodingKeys: String, CodingKey {
//        case user = "data"
//        case message
//        case errors
//    }
//}
//
//struct CatergoriesBannerApiParse: Codable {
//    let arrBanner: [Banners]?
//    let arrCategory: [Categories]?
//   
//    enum CodingKeys: String, CodingKey {
//        case arrBanner = "banners"
//        case arrCategory = "categories"
//    }
//}


//struct Banners: Codable {
//
//    var id : Int = 0
//    var restaurantId : Int = 0
//
//    var created_at = ""
//    var deleted_at = ""
//    var description = ""
//    var end_date = ""
//    var image = ""
//    var start_date = ""
//    var updated_at = ""
//
//}
//
//
//struct Categories: Codable {
//    let active : Int = 0
//    let id : Int = 0
//    var banner: String
//    let bannerS3: String
//    let created_at: String
//    let description: String
//    let image: String
//    let name: String
//    let updated_at: String
//
//
//}



