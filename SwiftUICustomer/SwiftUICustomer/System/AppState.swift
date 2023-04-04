
import SwiftUI
import Combine



class AppState: ObservableObject {
   
    static let shared = AppState()
    var Currentuserlocation : UserAddressNew!

    var DeviceTypeIntreface = UIDevice.current.userInterfaceIdiom
    
    let defaults = UserDefaults(suiteName: "")
    @Published var isGuestUser = false
    @Published var isGuestLogin = false

    @Published var isUserLoggedIn = false
    @Published var loggedUser: UserInfo? = nil
    @Published var busyCount = 0
    
    @Published var GuestaccessToken = ""

    @Published var userInfo: UserInfo!

    var cancellables = Set<AnyCancellable>()
    init() {
       // self.loggedUser = self.archivedUser
    }

    func becameActive() {

    }
}

extension AppState {
    
    var loggedIn: Bool {
       // return self.loggedUser != nil
        return isUserLoggedIn
        //app.currentUser != nil && app.currentUser?.state == .loggedIn
    }
    func login(_ user: UserInfo) {
        self.loggedUser = user
      //  self.archivedUser = user
        self.isUserLoggedIn = true
       
        Globals.print("USER LOGGED IN")
    }

    func updateUser(_ user: UserInfo) {
        self.loggedUser = user
       // self.archivedUser = user
        Globals.print("USER UPDATED")
    }

    func logout() {
        self.loggedUser = nil
        //self.archivedUser = nil
        self.isUserLoggedIn = false
        AppState.shared.userInfo = nil
        removeToUserDefault(keyUserInfo)
        Globals.print("USER LOGGED OUT")
    }

//    public var archivedUser: UserInfo? {
//        get {
//            if let data = defaults?.data(forKey: "User") {
//                do {
//                    let decoder = JSONDecoder()
//                    let user = try decoder.decode(User.self, from: data)
//
//                    Globals.print("LOADED LOGGED USER")
//
//                    return user
//                } catch {
//                    Globals.print("Unable to Decode User (\(error))")
//                }
//            }
//            return nil
//        }
//        set {
//            do {
//                let encoder = JSONEncoder()
//                let data = try encoder.encode(newValue)
//
//                defaults?.set(data, forKey: "User")
//            } catch {
//                Globals.print("Unable to Encode User (\(error))")
//            }
//        }
//    }
}

