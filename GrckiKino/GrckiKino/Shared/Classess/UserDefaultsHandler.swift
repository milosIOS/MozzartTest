//
//  UserDefaultsHandler.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
class UserDefaultsHandler {
    private init () {}
    static let shared = UserDefaultsHandler()
    
    private enum Key: String {
        /// check for first login key
        case isAppFirstTimeOpened
    }
    
    /// Return localy saved data for specific key
    private func getData<T>( _ key:Key) -> T? {
        return UserDefaults.standard.object(forKey: key.rawValue) as? T
    }
    
    /// Save localy data for specific key
    private func setData<T>(key:Key, value: T) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    //MARK:- Set/Get Is app opened for the first time
    
    /// Check is user first time in app
    var isAppOpenedFirstTime: Bool {
        set { setData(key: .isAppFirstTimeOpened, value: newValue) }
        get { return getData(.isAppFirstTimeOpened) ?? true }
    }
    
    /// Clear all localy saved data for new user
    var allUserDefaultsDataCleared: Bool {
        let defaults = UserDefaults.standard
        defaults.dictionaryRepresentation().keys.forEach(defaults.removeObject(forKey:))
        return true
    }
}
