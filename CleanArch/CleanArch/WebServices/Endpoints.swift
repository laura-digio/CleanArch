//
//  Endpoints.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import Moya

enum GitHubAPI {
    case userDetails(username: String)
    case userRepositories(username: String)
}

extension GitHubAPI: TargetType {

    var headers: [String : String]? {
        return [
            "User-Agent": NetworkClientConstants.Base.UserAgent
        ]
    }

    var baseURL: URL {
        return URL(string: NetworkClientConstants.Base.URL)!
    }

    var path: String {
        switch self {
        case let .userDetails(username):
            return "users/\(username)"

        case let .userRepositories(username):
            return "users/\(username)/repos"
        }
    }

    var method: Moya.Method {
        switch self {
        case .userDetails:
            return .get

        case .userRepositories:
            return .get
        }
    }

    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    // MARK: - Mock

    /**
     * Code to enabled mocking:
     * let provider = MoyaProvider<MyAPI>(stubClosure: MoyaProvider<MyAPI>.immediatelyStub)
     */
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
}
