//
//  User.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.
//

import Foundation

struct APIModel: Codable {
    let message: String?
    let errors: [String: [String]]?
}

struct Guest: Codable {
    let accessToken: String
    let isSocialLogin: Int
    let placeApiKey: String
}


struct GuestData: Codable {
    let user: GuestDa?
    let message: String
    let status: String
    let statusCode: Int
    let errors: [String: [String]]?

    enum CodingKeys: String, CodingKey {
        case user = "data"
        case message
        case status
        case statusCode
        case errors
    }
}

struct SignUp: Codable {
    let user: SignUpData?
    let message: String?
    let errors: [String: [String]]?
    
    enum CodingKeys: String, CodingKey {
        case user = "data"
        case message
        case errors
    }
}

                    
struct UserData: Codable {
    let user: User?
    let message: String?
    let errors: [String: [String]]?
    
    enum CodingKeys: String, CodingKey {
        case user = "data"
        case message
        case errors
    }
}


struct User: Codable {
    
    var accessToken = ""
   // var authorize_profile_id = ""
    var country_code = ""
    var created_at = ""
    var email = ""
    var email_verified = 0
    var mobile_number = ""
    var image : String?
    var mobile_verify = 0
    var name = ""
    var status = 0
    var updated_at = ""
    var user_type = 0
    var first_name = ""
    var last_name = ""
    var PayerAccountID = ""

    let message: String?

    let errors: [String: [String]]?

    enum CodingKeys: String, CodingKey {
       
        
        case accessToken
      //  case authorize_profile_id
        case country_code
        case created_at
        case email
        case email_verified
        case mobile_number
        case image
        case mobile_verify
        case name
        case status
        case updated_at
        case user_type
        case first_name
        case last_name
      //  case socialLogin
        case PayerAccountID
        case message
        case errors
    }
}




struct SignUpData: Codable {
    
    //var accessToken = ""
   // var country_code = 0
    var created_at = ""
    var email = ""
    var mobile_number = ""
    var image = ""
    var name : String?
    var status = 0
    var updated_at = ""
    var user_type = 0
    var id = 0
    var otp = 0
    var first_name = ""
    var last_name = ""
    var PayerAccountID = ""
    let message: String?

    let errors: [String: [String]]?

    enum CodingKeys: String, CodingKey {
       
       // case accessToken
       // case country_code
        case created_at
        case id
        case otp
        case email
        case mobile_number
        case image
        case name
        case status
        case updated_at
        case user_type
        case first_name
        case last_name
        case PayerAccountID
        case message
        case errors
    }
  
}


struct GuestDa: Codable {
    let isSocialLogin: Bool
    var accessToken: String
    let placeApiKey: String

    enum CodingKeys: String, CodingKey {
        case isSocialLogin = "isSocialLogin"
        case accessToken = "accessToken"
        case placeApiKey = "placeApiKey"
    }
}

class UserInfo: NSObject, NSCoding {
    
    var accessToken = ""
    var authorize_profile_id = ""
    var country_code = ""
    var created_at = ""
    var email = ""
    var email_verified = ""
    var user_id = ""
    var mobile_number = ""
    var image = ""
    var mobile_verify = ""
    var name = ""
    var status = ""
    var updated_at = ""
    var user_type = ""
    var facebook_key = ""
    var google_key = ""
    var device_id = ""
    var device_type = ""
    var device_token = ""
    var address = ""
    var city = ""
    var country = ""
    var latitude :  Double = 0.0
    var longitude : Double = 0.0
    var first_name = ""
    var last_name = ""
    var socialLogin: Bool = false
    var PayerAccountID = ""
    var getToken = ""
    var PaymentMethodId = ""
    // var arrUserAddress : [Address] = []
    
    override init() {}
    
    init(dict: [String: Any], _ forOtherUser: Bool = false) {
        
        super.init()
        
        self.accessToken = getStringValue(dict, "accessToken")
        self.authorize_profile_id = getStringValue(dict, "authorize_profile_id")
        self.country_code = getStringValue(dict, "country_code")
        self.created_at = getStringValue(dict, "created_at")
        self.email = getStringValue(dict, "email")
        self.email_verified = getStringValue(dict, "email_verified")
        self.user_id = getStringValue(dict, "user_id")
        self.mobile_number = getStringValue(dict, "mobile_number")
        self.image = getStringValue(dict, "image")
        self.mobile_verify = getStringValue(dict, "mobile_verify")
        self.name = getStringValue(dict, "name")
        self.status = getStringValue(dict, "status")
        self.updated_at = getStringValue(dict, "updated_at")
        self.user_type = getStringValue(dict, "user_type")
        self.facebook_key = getStringValue(dict, "facebook_key")
        self.google_key = getStringValue(dict, "google_key")
        self.device_id = getStringValue(dict, "device_id")
        self.device_type = getStringValue(dict, "device_type")
        self.device_token = getStringValue(dict, "device_token")
        self.address = getStringValue(dict, "address")
        self.city = getStringValue(dict, "city")
        self.country = getStringValue(dict, "country")
        self.latitude = getNumber(dict, "latitude").doubleValue
        self.longitude = getNumber(dict, "longitude").doubleValue
        self.first_name = getStringValue(dict, "first_name")
        self.last_name = getStringValue(dict, "last_name")
        self.socialLogin = getBooleanValue(dict, key: "socialLogin")
        self.PayerAccountID = getStringValue(dict, "PayerAccountID")
        self.getToken = getStringValue(dict, "getToken")
        self.PaymentMethodId = getStringValue(dict, "PaymentMethodId")
//        if let arr = dict["userAddress"] as? [[String: Any]] {
//            for x in arr {
//                arrUserAddress.append(Address(coder: x))
//            }
//        }
        
       // saveToUserDefault("arrUserAddresses", arrUserAddress)
        saveToUserDefault(kAccessToken, self.accessToken)
        saveToUserDefault(keyUserInfo, self)
    }
    
    func update(dict: [String: Any]) {
        
        self.accessToken = getStringValue(dict, "accessToken")
        self.authorize_profile_id = getStringValue(dict, "authorize_profile_id")
        self.country_code = getStringValue(dict, "country_code")
        self.created_at = getStringValue(dict, "created_at")
        self.email = getStringValue(dict, "email")
        self.email_verified = getStringValue(dict, "email_verified")
        self.user_id = getStringValue(dict, "user_id")
        self.mobile_number = getStringValue(dict, "mobile_number")
        self.image = getStringValue(dict, "image")
        self.mobile_verify = getStringValue(dict, "mobile_verify")
        self.name = getStringValue(dict, "name")
        self.status = getStringValue(dict, "status")
        self.updated_at = getStringValue(dict, "updated_at")
        self.user_type = getStringValue(dict, "user_type")
        self.facebook_key = getStringValue(dict, "facebook_key")
        self.google_key = getStringValue(dict, "google_key")
        self.device_id = getStringValue(dict, "device_id")
        self.device_type = getStringValue(dict, "device_type")
        self.device_token = getStringValue(dict, "device_token")
        self.address = getStringValue(dict, "address")
        self.city = getStringValue(dict, "city")
        self.country = getStringValue(dict, "country")
        self.latitude = getNumber(dict, "latitude").doubleValue
        self.longitude = getNumber(dict, "longitude").doubleValue
        self.first_name = getStringValue(dict, "first_name")
        self.last_name = getStringValue(dict, "last_name")
        self.socialLogin = getBooleanValue(dict, key: "socialLogin")
        self.PayerAccountID = getStringValue(dict, "PayerAccountID")
        self.getToken = getStringValue(dict, "getToken")
        self.PaymentMethodId = getStringValue(dict, "PaymentMethodId")
//        if let arr = dict["userAddress"] as? [[String: Any]] {
//            for x in arr {
//                arrUserAddress.append(Address(coder: x))
//            }
//        }
        
      //  saveToUserDefault("arrUserAddresses", arrUserAddress)
        saveToUserDefault(keyUserInfo, self)
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(accessToken, forKey: "accessToken")
        aCoder.encode(authorize_profile_id, forKey: "authorize_profile_id")
        aCoder.encode(country_code, forKey: "country_code")
        aCoder.encode(created_at, forKey: "created_at")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(email_verified, forKey: "email_verified")
        aCoder.encode(user_id, forKey: "user_id")
        aCoder.encode(mobile_number, forKey: "mobile_number")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(mobile_verify, forKey: "mobile_verify")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(status, forKey: "status")
        aCoder.encode(updated_at, forKey: "updated_at")
        aCoder.encode(user_type, forKey: "user_type")
        aCoder.encode(facebook_key, forKey: "facebook_key")
        aCoder.encode(google_key, forKey: "google_key")
        aCoder.encode(facebook_key, forKey: "facebook_key")
        aCoder.encode(google_key, forKey: "google_key")
        aCoder.encode(device_id, forKey: "device_id")
        aCoder.encode(device_type, forKey: "device_type")
        aCoder.encode(device_token, forKey: "device_token")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(city, forKey: "city")
        aCoder.encode(country, forKey: "country")
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(first_name, forKey: "first_name")
        aCoder.encode(last_name, forKey: "last_name")
        aCoder.encode(socialLogin, forKey: "socialLogin")
        aCoder.encode(PayerAccountID, forKey: "PayerAccountID")
        aCoder.encode(getToken, forKey: "getToken")
        aCoder.encode(PaymentMethodId , forKey: "PaymentMethodId")
        aCoder.encode(mobile_verify , forKey: "mobile_verify")
        
       
     //   aCoder.encode(arrUserAddress, forKey: "userAddress")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
    
        let accessToken: String = aDecoder.decodeObject(forKey: "accessToken") as? String ?? ""
        let authorize_profile_id: String = aDecoder.decodeObject(forKey: "authorize_profile_id") as? String ?? ""
        let country_code: String = aDecoder.decodeObject(forKey: "country_code") as? String ?? ""
        let created_at: String = aDecoder.decodeObject(forKey: "created_at") as? String ?? ""
        let email: String = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        let email_verified: String = aDecoder.decodeObject(forKey: "email_verified") as? String ?? ""
        let user_id: String = aDecoder.decodeObject(forKey: "user_id") as? String ?? ""
        let mobile_number1: String = aDecoder.decodeObject(forKey: "mobile_number") as? String ?? ""
        let image: String = aDecoder.decodeObject(forKey: "image") as? String ?? ""
        
        let mobile_verify: String = aDecoder.decodeObject(forKey: "mobile_verify") as? String ?? ""
        let name: String = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        let status: String = aDecoder.decodeObject(forKey: "status") as? String ?? ""
        let updated_at: String = aDecoder.decodeObject(forKey: "updated_at") as? String ?? ""
        let user_type: String = aDecoder.decodeObject(forKey: "user_type") as? String ?? ""
        let facebook_key: String = aDecoder.decodeObject(forKey: "facebook_key") as? String ?? ""
        let google_key: String = aDecoder.decodeObject(forKey: "google_key") as? String ?? ""
        let device_id: String = aDecoder.decodeObject(forKey: "device_id") as? String ?? ""
        let device_type: String = aDecoder.decodeObject(forKey: "device_type") as? String ?? ""
        let device_token: String = aDecoder.decodeObject(forKey: "device_token") as? String ?? ""
        let address: String = aDecoder.decodeObject(forKey: "address") as? String ?? ""
        let city: String = aDecoder.decodeObject(forKey: "city") as? String ?? ""
        let country: String = aDecoder.decodeObject(forKey: "country") as? String ?? ""
        let latitude: Double = aDecoder.decodeDouble(forKey: "latitude") as? Double ??  0.0
        let longitude: Double = aDecoder.decodeDouble(forKey: "longitude") as? Double ??  0.0
        let first_name: String = aDecoder.decodeObject(forKey: "first_name") as? String ?? ""
        let last_name: String = aDecoder.decodeObject(forKey: "last_name") as? String ?? ""
        let socialLogin: Bool = aDecoder.decodeBool(forKey: "socialLogin")
        let PayerAccountID: String = aDecoder.decodeObject(forKey: "PayerAccountID") as? String ?? ""
        let getToken: String = aDecoder.decodeObject(forKey: "getToken") as? String ?? ""
        let PaymentMethodId: String = aDecoder.decodeObject(forKey: "PaymentMethodId") as? String ?? ""
       // let arrAddress: [Address] = aDecoder.decodeObject(forKey: "arrUserAddress") as? [Address] ?? []
        
        
        self.init(accessToken: accessToken, authorize_profile_id: authorize_profile_id, country_code: country_code, created_at: created_at, email: email, email_verified: email_verified, user_id: user_id, mobile_no: mobile_number1, image:image, mobile_verify:mobile_verify, name:name, status:status, updated_at :updated_at, user_type:user_type, facebook_key:facebook_key, google_key:google_key, device_id:device_id, device_type:device_type, device_token:device_token, address: address, city: city, country: country, latitude: latitude, longitude: longitude, first_name: first_name, last_name:last_name, socialLogin: socialLogin, PayerAccountID:PayerAccountID, getToken: getToken, PaymentMethodId: PaymentMethodId /*, arrAddress:arrAddress*/)
        
    }
    
    init(accessToken: String, authorize_profile_id: String, country_code: String, created_at: String, email: String, email_verified: String, user_id: String, mobile_no: String, image: String, mobile_verify: String, name:String, status:String, updated_at :String, user_type:String, facebook_key:String, google_key:String, device_id:String, device_type:String, device_token:String, address: String, city: String, country :String, latitude: Double, longitude: Double, first_name: String, last_name: String, socialLogin: Bool, PayerAccountID: String, getToken: String, PaymentMethodId: String/*, arrAddress:[Address]*/) {
        
        self.accessToken = accessToken
        self.authorize_profile_id = authorize_profile_id
        self.country_code = country_code
        self.created_at = created_at
        self.email = email
        self.email_verified = email_verified
        self.user_id = user_id
        self.mobile_number = mobile_no
        self.image = image
        self.mobile_verify = mobile_verify
        self.name = name
        self.status = status
        self.updated_at = updated_at
        self.user_type = user_type
        self.facebook_key = facebook_key
        self.google_key = google_key
        self.device_id = device_id
        self.device_type = device_type
        self.device_token = device_token
        self.address = address
        self.city = city
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.first_name = first_name
        self.last_name = last_name
        self.socialLogin = socialLogin
        self.PayerAccountID = PayerAccountID
        self.getToken = getToken
        self.PaymentMethodId = PaymentMethodId
       // self.arrUserAddress = arrAddress
    }
}

class UserAddressNew : NSObject, NSCoding  {
    
    var state = ""
    var adress = ""
    var street = ""
    var zipcode = ""
    var City = ""
    var Country = ""
    var latitude :  Double = 0.0
    var longitude : Double = 0.0
    
    override init() {}
    
    init(dict: [String: Any], _ forOtherUser: Bool = false) {
        
        super.init()
        self.state = getStringValue(dict, "state")
        self.adress = getStringValue(dict, "adress")
        self.street = getStringValue(dict, "street")
        self.zipcode = getStringValue(dict, "zipcode")
        self.City = getStringValue(dict, "City")
        self.Country = getStringValue(dict, "Country")
        self.latitude = getNumber(dict, "latitude").doubleValue
        self.longitude = getNumber(dict, "longitude").doubleValue
        saveToUserDefault(Userlocation, self)
    }
    
    func update(dict: [String: Any]) {
        
        
        self.state = getStringValue(dict, "state")
        self.adress = getStringValue(dict, "adress")
        self.street = getStringValue(dict, "street")
        self.zipcode = getStringValue(dict, "zipcode")
        self.City = getStringValue(dict, "City")
        self.Country = getStringValue(dict, "Country")
        self.latitude = getNumber(dict, "latitude").doubleValue
        self.longitude = getNumber(dict, "longitude").doubleValue
         saveToUserDefault(Userlocation, self)
        
    }
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(state, forKey: "state")
        aCoder.encode(street, forKey: "street")
        aCoder.encode(zipcode, forKey: "zipcode")
        aCoder.encode(City, forKey: "City")
         aCoder.encode(adress, forKey: "adress")
        aCoder.encode(Country, forKey: "Country")
         aCoder.encode(latitude, forKey: "latitude")
         aCoder.encode(longitude, forKey: "longitude")
            
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let state: String = aDecoder.decodeObject(forKey: "state") as? String ?? ""
        let street: String = aDecoder.decodeObject(forKey: "street") as? String ?? ""
        let zipcode: String = aDecoder.decodeObject(forKey: "zipcode") as? String ?? ""
        let City: String = aDecoder.decodeObject(forKey: "City") as? String ?? ""
        let Country: String = aDecoder.decodeObject(forKey: "Country") as? String ?? ""
        let latitude: Double = aDecoder.decodeDouble(forKey: "latitude") as? Double ??  0.0
        let longitude: Double = aDecoder.decodeDouble(forKey: "longitude") as? Double ??  0.0
        let adress: String = aDecoder.decodeObject(forKey: "adress") as? String ?? ""
//        let temp =  aDecoder.decodeInt64(forKey: "longitude")
//
//        print(temp)
        
        self.init(state: state, street: street, zipcode: zipcode, City: City, Country: Country , latitude : latitude , longitude : longitude , adress : adress)
        
    }
    
    init(state: String, street: String, zipcode: String,City: String, Country: String , latitude : Double , longitude : Double, adress :String) {
        
        self.state = state
        self.street = street
        self.zipcode = zipcode
        self.City = City
        self.Country = Country
        self.latitude = latitude
        self.longitude = longitude
        self.adress = adress
    }
}
