//
//  Endpoints.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import Moya

enum GitHubAPI {
    case listItems(query: String = "SwiftUI", page: UInt = 0, perPage: UInt = 20)
    case detail(username: String)
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
        case .listItems:
            return "search/repositories"

        case let .detail(username):
            return "users/\(username)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .listItems:
            return .get

        case .detail:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .listItems(query, page, perPage):
            let parameters = ["q": query,
                              "page": String(page),
                              "per_page": String(perPage)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
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
