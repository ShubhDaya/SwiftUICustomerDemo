//
//  UserStateViewModel.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.

import Foundation
import SwiftUI
import Alamofire

final class UserStateViewModel: ObservableObject {
    // lazy var appConfiguration = AppConfiguration.shared
    //  @Published var userStats: UserStats?
    
    typealias onCompletionHandler = () -> Void
    
  
    
    
    
    //    func forgotPassword(_ authenticationForm: AuthenticationForm,
    //                        onCompletion: @escaping onCompletionHandler) {
    //        let parameters = ["email": authenticationForm.email]
    //
    //        AF.request(base_url + "password/reset",
    //                   method: .post,
    //                   parameters: parameters,
    //                   headers: APIManager.getUnauthenticatedHeaders())
    //        .responseDecodable(of: UserData.self) { response in
    //
    //            Globals.print(response)
    //
    //            guard let userData = response.value else {
    //                return
    //            }
    //
    //            if let errors = userData.errors {
    //                authenticationForm.updateErrors(errors: errors)
    //                return
    //            }
    //
    //            onCompletion()
    //        }
    //    }
    
    //    func me() {
    //        AF.request(appConfiguration.APIBaseURL() + "me",
    //                   method: .get,
    //                   encoding: JSONEncoding.default,
    //                   headers: APIManager.getHeaders())
    //        .responseDecodable(of: UserData.self) { [weak self] (response) in
    //            guard let userData = response.value else { return }
    //            Globals.print(response)
    //
    //            var user = userData.user
    //
    //            if let loggedUser = AppState.shared.loggedUser, let userAPIToken = loggedUser.APIToken {
    //                user?.APIToken = userAPIToken
    //            }
    //
    //            if let user = user {
    //                AppState.shared.updateUser(user)
    //            }
    //        }
    //    }
    
    //    func stats() {
    //        AF.request(appConfiguration.APIBaseURL() + "me/stats",
    //                   method: .get,
    //                   encoding: JSONEncoding.default,
    //                   headers: APIManager.getHeaders())
    //        .responseDecodable(of: UserStatsResponse.self) { [weak self] (response) in
    //            guard let userData = response.value else { return }
    //
    //            Globals.print(response)
    //
    //            if let userStats = userData.userStats {
    //                self?.userStats = userStats
    //            } else {
    //                self?.userStats = UserStats(achievements_claimed_count: 0,
    //                                            achievements_unclaimed_count: 0,
    //                                            events_count: 0)
    //            }
    //
    //            Globals.print("USER UPDATED")
    //        }
    //    }
    
    func resendVerificationEmail(onCompletion: @escaping onCompletionHandler) {
        
        AF.request(base_url + "email/resend",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: APIManager.getHeaders())
        .response(completionHandler: { dataResponse in
            if dataResponse.response?.statusCode == 200 {
                onCompletion()
            } else {
                Globals.print("failed")
            }
        })
    }
}

extension Data {
    func decodedObject<T: Decodable>() throws -> T {
        try JSONDecoder.shared.decode(T.self, from: self)
    }
}
extension JSONDecoder {
    static let shared: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
