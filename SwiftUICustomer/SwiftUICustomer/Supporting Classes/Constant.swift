//
//  Constant.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.
//

import Foundation


import UIKit

@available(iOS 10.0, *)
let appDelegate =  UIApplication.shared.delegate as! AppDelegate
let notificationDefault = NotificationCenter.default
let userDeviceId = UIDevice.current.identifierForVendor?.uuidString
let deviceOSVersion = UIDevice.current.systemVersion
let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
let deviceType = "iphone"
let passwordKey = "encrPassword"
let google_place_map_key = "AIzaSyCjlFqIdN2VkDs74SlkhCEYr9NmtOl7xnc"
let google_map_service = "AIzaSyBqHNxEUbP3cqrgdoNJ4f2_58ie8mjxXYI"

let feasterly_google_map_key = "AIzaSyBHf-IoDXiBCeXLe0H4fKjKWlOD0UoC3ps"
let google_directionAPI_key = "AIzaSyCV8CGdbjXBgnskGzov8tN3QVtZ8UuzNZg"

//let temp_Google_Place_Map_Key = "AIzaSyCzzk6udOmuPeSBIFbExGGTQuIAqPlen58"

let keyUserInfo = "userinfo"
let keyUserLocation = "userLocation"

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
//old bundle id com.ios.OrderZilla

let deviceTokonSent = "deviceTokenSent"

let KseeFoodsSkipclick = "seefoodsClick"
let KdeviceIDSaved = "deviceIDSaved"

//development new Url http://103.187.101.54:3000
//stagging Url  http://13.56.153.188:3000
//let base_url = "http://103.76.253.134:3002"  //qa Url
//let base_url = "http://52.13.107.0:3002"  //aws cloud
//let base_url        = "http://13.56.153.188:3000/v6"

let base_url        = "http://13.56.153.188:3000/v6"
//let base_url        = "http://103.187.101.54:300/v6"

// deveplement Updated  http://103.187.101.54:3000
//"http://13.56.153.188:3000/v4" //"https://app.feasterly.com:3000" production  //"http://54.183.30.213:3000"//"https://app.feasterly.com:3000"//"http://52.53.253.126:3000"  //"//"http://35.81.106.224:3000"
//http://13.56.153.188:3000/v3 develoment
//http://52.53.253.126:3000/"
//"http://52.53.253.126:3000" //latest aws url
//http://34.222.46.77:3002

let base_url_image        = "http://13.56.153.188:3000"
// production https://app.feasterly.com:3000

let locationService = LocationService()
let kAccessToken = "access_token"
let identifier = UIDevice.current.identifierForVendor?.uuidString

let kUserAdressSaved = "user_AdressesSaved"
let Userlocation = "savedUserLocation"
let kUserAddAddressSaved = "user_AddAddressSaved"

//let ocrScanUrl = "http://qa1.lmsin.com/api/py/getBusinessCardInfo"

var testingEnviroment = true
let keyRazoPay = testingEnviroment ? "rzp_test_Z1GfNC3VbbqKCV" : "rzp_live_u5Umvmdkc3s0O9"

//let keyTestRazorPay = "rzp_test_Z1GfNC3VbbqKCV"//"rzp_test_1DP5mmOlF5G5ag"
//let keyLiveRazorPay = "rzp_live_u5Umvmdkc3s0O9"
let isDevelopment = true

enum OrderStatus:String {
    case AutoComplet = "AUTO COMPLETE"
    case orderPlaced = "ORDER PLACED"
    case orderAccepted = "ORDER ACCEPTED"
    case preparingFood = "PREPARING FOOD"
    case readyForPickup = "READY FOR PICKUP"
    case delivered = "DELIVERED"
    case cancelled = "CANCELLED"
    case declined = "DECLINED"
    case notAccepted = "NOT ACCEPTED"
    case notPickup = "NOT PICKUP"
    case pickedUp = "ORDER PICKED UP"
    case deliveryInProgress = "DELIVERY IN PROGRESS"
}


enum RequestMethod:String {
    case kMethodGet = "GET"
    case kMethodPost = "POST"
    case kMethodPUT = "PUT"
    case kMethodDelete = "DELETE"
}

enum ColorCode:String {
    case buttonbackgroundColor = "buttonbackgroundColor"
    case OraneColor = "OraneColor"
    case BlackColor = "BlackColor"
    case AllViewBackgroundcolor = "AllViewBackgroundcolor"
    case headerTitle1 = "headerTitle1"
    case headerTitle2 = "headerTitle2"
    case SubHeader = "SubHeader"
    case TitleColor = "TitleColor"
    case ExtraTitleColor = "ExtraTitleColor"
    case BlackAndWhite = "BlackAndWhite"
    case OnlyBlack = "OnlyBlack"
    case WhiteandBlack = "WhiteandBlack"
    case TitleDarkBlue = "TitleDarkBlue"
    case DidSelectColor = "DidSelectColor"
    case backgroundColor = "backgroundColor"
    case Color94 = "Color94"
    
    
  
}

enum ImageAssetImages : String {
    case checkbox = "checkbox.png"
}

enum EnumProfileOptions : String {
    case dietandAlergies = "Diet & Allergies"
    case ChangePassword = "Change Password"
    case HelpSupport = "Help & Support"
    case Logout = "Logout"
}

enum ServiceType: String {
    case kTaskGuestToken = "guestToken"
    case kTaskLogin = "login"
    case kTaskSignUp = "signup"
    case kTaskSocialLogin = "social"
    case kTaskForgetPassword = "forgetPassword"
    case kTaskGetCategories = "categories"
    case kTaskNearRestaurant = "near_restaurant"
    case kTaskCustomerFavourite = "customer_favourite"
    case kTaskCustomerRestuarantDetail = "restuarant_detail"
    case kTaskCustomerAddress = "address"
    case kTaskChangePassword = "changePassword"
    case kTaskResetPassword = "resetPassword"
    case kTaskUpdateCart = "updateCart"
    case kTaskCart = "cart"
    case kTaskRecentQuestion = "recentQuestion"
    case kTaskBaseApi = "baseApi"
    case kTaskAskQues = "ask_question"
    case kTaskFoodCartStatus = "foodCartStatus"
    case kTaskEditCart = "editCart"
    case kTaskRemoveCart = "removeCart"
    case kTaskClearCart = "clearCart"
    case kTaskCreateOrder = "createOrder"
    case kTaskGetMyOrders = "getMyOrders"
    case kTaskRepeatOrder = "repeatOrder"
    case kTaskCancelOrder = "cancelOrder"
    case kTaskOrderDetail = "orderDetail"
    case kTaskPostQuery = "postQuery"
    case kTaskAddInstruction = "addInstruction"
    case kTaskNotification = "notification"
    case kTaskUploadFile = "upload-file"
    case kTaskContactUs = "contactUs"
    case kTaskPrivacyPolicy = "privacyPolicy"
    case kTaskReportIssue = "reportIssue"
    case kTaskAddAddress = "addAddress"
    case kTaskGetAddress = "getAddress"
    case kTaskDeleteAddress = "deleteAddress"
    case kTaskUpdateProfile = "updateProfile"
    case kTaskMobileVerified = "mobileVerified"
    case kTaskResendOtp = "resendOtp"
    case kTaskGetChangDefaultAddress = "changDefaultAddress"
    case kTaskGetCards = "getCards"
    case kTaskAddCard = "addCard"
    case kTaskUpdateImg = "updateImage"
    case kTaskDeleteCard = "deleteCard"
    case kTaskAddNumber = "phonenumber"

    case kTaskGetDeliverFees = "getDeliverFees"
    case kTaskGetDriverLocation = "getDriverLocation"
    case kTaskLogout      = "logout"
    case kTaskReviewRating = "review"
    case kTaskItemAvailability = "itemAvailability"
    case kTaskApplyCoupon = "applyCoupon"
    case kTaskGetPayerAccountId = "getPayerAccountId"
    case kTaskPaymentMethodId = "paymentMethodId"
    case kTaskGetToppings = "TaskGetToppings"
    case kTaskBaseInfo = "TaskBaseInfo"
}

struct servicesAction {
    static let guestToken = "/guest/token"
    static let login = "/auth/login"
    static let signUp = "/auth/registration"
    static let socialSignUp = "/auth/social-login"
    static let forgetPassword = "/auth/forget-password"
    static let getCategories = "/restuarent/categories"
    static let near_restaurant = "/customer/near-restuarents"
    static let customer_favourite = "/customer/favourite"
    static let restaurant_detail = "/customer/restuarant-detail"
    static let customer_address = "/customer/address"
    static let change_Password = "/auth/change-password"
    static let reset_Password = "/auth/reset-password"
    static let cart_add = "/cart/add"
    static let cart = "/cart/myCart"
    static let recent_Question = "/customer/recent-questions"
    static let baseApi = "/customer/baseApi"
    static let customer_askQues = "/customer/ask-question"
    static let foodCartStatus = "/cart/food-cart-status"
    static let cart_edit = "/cart/edit"
    static let cartRemove = "/cart/remove"
    static let cartClear = "/cart/clear"
    static let createOrder = "/order/customer/create"
    static let getMyOrders = "/order/customer/my-orders"
    static let repeatOrders = "/order/customer/repheat-order"
    static let cancelOrder = "/order/customer/cancel-order"
    static let orderDetail = "/order/customer/order-detail"
    static let customer_postQuery = "/customer/post-query"
    static let addInstruction = "/order/customer/add-instruction"
    static let notification = "/customer/notifications?"
    static let uploadFile = "/customer/upload-file"
    static let contactUs = "/customer/contact-us"
    static let privacyPolicy = "/customer/privacy-policy"
    static let reportIssue = "/order/customer/report-issue"
    static let addAddress = "/customer/add-address"
    static let getAddress = "/customer/address"
    static let deleteAddress = "/customer/remove-address"
    static let updateProfile = "/customer/update-profile"
    static let review_rating = "/customer/review"
    static let mobile_verified = "/auth/mobile-verified"
    static let resend_otp = "/auth/resend-otp"
    static let chngDefaultAddress = "/customer/chang-default-address/"
    static let getCards = "/payment/customer/getCards"
    static let addCard = "/payment/customer/add-Card"
    static let updateImg = "/customer/update-image"
    static let resendOtp = "/auth/resend-otp?device_type="
    static let deleteCard = "/payment/customer/remove-card"
    static let getDeliveryFees = "/order/customer/get-delivery-fees"
    static let getDriverLocation = "/customer/get-driver-location"
    static let logout         = "/auth/logout"
    static let itemAvailability = "/order/customer/item-availability"
    static let applyCoupon = "/order/customer/apply-coupan"
    static let getPayerAccountId = "/payment/customer/getPayerAccountId"
    //static let getPaymentMethodId  = "/protectpay/Payers/9919553333452793/PaymentMethods"
    static let getPaymentMethodId  = "/protectpay/Payers/9919553333452793/PaymentMethods/"
    static let getTopping = "/customer/get-toppings-list"
    static let baseInfo  = "/auth/baseInfo"
}
enum keyStructure:String {
    case kAccessToken = "access_token"
    case deviceToken = "device_token"
    case kUserDetail = "user_information"
    case kBlackTheme = "BlackTheme"
    case kWhiteTheme = "WhiteTheme"
    case kSelectedTheme = "SelectedTheme"
}

struct Path {
    static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    static let Tmp = NSTemporaryDirectory()
}

enum SocialLink {
    case facebook
    case instagram
    case linkedin
    case pintrest
    case twitter
}

enum ShareCardType {
    case userid
    case email
    case sms
    case other
    case qrcode
    case nearby
    case none
}

enum LinkType {
    case social
    case important
    case additional
    case other
}

enum AddCardType {
    case add
    case edit
    case scan
}

enum UserType: String {
 
    case free = "FREE"
    case premium = "PREMIUM"
    case corporate = "CORPORATE"
}
let IOS = "IOS"

func getGenderString(type: String) -> String {
    if type.lowercased() == "m" {
        return "Male"
    } else if type.lowercased() == "f" {
        return "Female"
    } else if type.lowercased() == "o" {
        return "Other"
    }
    return ""
}
