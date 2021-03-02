//
//  UserDefaults+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension UserDefaults {
    private enum Keys: String {
        case appState
    }

    // Get, Set and Remove appState!
    @Storage(key: UserDefaults.Keys.appState.rawValue, defaultValue: nil)
    static var appState: AppState?
}

@propertyWrapper
struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T?

    init(key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T? {
        get {
            // Read value from UserDefaults
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }

            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(T?.self, from: data)
            return value ?? defaultValue
        }
        set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: key)
            } else {
                // Convert newValue to data
                let data = try? JSONEncoder().encode(newValue)

                // Set value to UserDefaults
                UserDefaults.standard.set(data, forKey: key)
            }
        }
    }
}
