//
//  Repository+User.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * Repository for entity User
 */

import Foundation
import Moya

// MARK: Local

extension Repository {

    var user: User? {
        get {
            return UserDefaults.user
        }
        set {
            UserDefaults.user = newValue
        }
    }
}

// MARK: Remote web service

extension Repository {

    func requestAuthorization(_ username: String, _ password: String, callback: @escaping (User?) -> Void) {
        networkClient.provider.request(.auth(username: username, password: password)) { [self] result in
            parseUser(result: result, callback: callback)
        }
    }

    func requestAuthToken(_ token: String,
                          provider: NetworkClientConstants.SSOProvider,
                          fullName: String? = nil,
                          callback: @escaping (User?) -> Void) {
        networkClient.provider.request(.authToken(token, SSOprovider: provider, fullName: fullName)) { [self] result in
            parseUser(result: result, callback: callback)
        }
    }

    func requestGetInitData(session: String, callback: @escaping (User?) -> Void) {
        networkClient.provider.request(.getInitData(session: session)) { [self] result in
            parseUser(result: result, callback: callback, keyPath: "userInfo")
        }
    }
}

// MARK: Private

extension Repository {
    private func parseUser(result: Result<Response, MoyaError>,
                           callback: @escaping (User?) -> Void,
                           keyPath: String? = nil) {
        switch result {
        case let .success(response):
            do {
                var user: User?
                if let keyPath = keyPath {
                    let json = (try response.mapJSON(failsOnEmptyData: false) as? NSDictionary)?.value(forKeyPath: keyPath)
                    if let json = json as? [String: Any] {
                        user = User(JSON: json)
                    }
                }
                else {
                    user = try User(JSONString: response.mapString())
                }
                if !(user?.id ?? "").isEmpty {
                    return callback(user) // success
                }
                callback(nil)
            } catch {
                #if DEBUG
                debugPrint(error)
                #endif

                callback(nil)
            }
        case .failure(_):
            callback(nil)
        }
    }
}
