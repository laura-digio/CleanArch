//
//  Endpoints.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import Moya

enum IvooxAPI {
    case auth(username: String, password: String)
    case authToken(_ token: String, SSOprovider: NetworkClientConstants.SSOProvider, fullName: String?)
    case getInitData(session: String)
    case getSubscriptionAudios(session: String, unread: Bool, page: UInt)
    case getSubscriptions(session: String, order: NetworkClientConstants.SubscriptionsSorting)
    case getAudiosLiveList(session: String)
    case getLikedAudios(session: String, page: UInt)
    case getPendingAudios(session: String, page: UInt)
    case listsByUser(session: String)
    case audiosByList(session: String, listID: String, page: UInt)
}

extension IvooxAPI: TargetType {

    var headers: [String : String]? {
        return [
            "User-Agent": NetworkClientConstants.Base.UserAgent
        ]
    }

    var baseURL: URL {
        var rawPath = "?format=json"

        switch self {
        case .auth:
            rawPath += "&function=\(NetworkClientConstants.Function.Login)"

        case let .authToken(_, SSOProvider, _):
            rawPath += "&function=\(SSOProvider.rawValue)"

        case .getInitData:
            rawPath += "&function=\(NetworkClientConstants.Function.GetInitData)"

        case .getSubscriptionAudios:
            rawPath += "&function=\(NetworkClientConstants.Function.GetSubscriptionAudios)"

        case .getSubscriptions:
            rawPath += "&function=\(NetworkClientConstants.Function.GetSubscriptions)"

        case .getAudiosLiveList:
            rawPath += "&function=\(NetworkClientConstants.Function.GetAudiosLiveList)"

        case .getLikedAudios:
            rawPath += "&function=\(NetworkClientConstants.Function.GetLikedAudios)"

        case .getPendingAudios:
            rawPath += "&function=\(NetworkClientConstants.Function.GetPendingAudios)"

        case .listsByUser:
            rawPath += "&function=\(NetworkClientConstants.Function.ListsByUser)"

        case .audiosByList:
            rawPath += "&function=\(NetworkClientConstants.Function.AudiosByList)"
        }

        let url = "\(NetworkClientConstants.Base.URL)/\(NetworkClientConstants.Base.Version)/\(rawPath)"
        return URL(string: url)!
    }

    var path: String {
        return ""
    }

    var method: Moya.Method {
        switch self {
        case .auth:
            return .post

        case .authToken:
            return .post

        case .getInitData:
            return .get

        case .getSubscriptionAudios:
            return .get

        case .getSubscriptions:
            return .get

        case .getAudiosLiveList:
            return .get

        case .getLikedAudios:
            return .get

        case .getPendingAudios:
            return .get

        case .listsByUser:
            return .post

        case .audiosByList:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .auth(username, password):
            let parameters = ["email": username,
                              "pwd": password]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .authToken(token, _, fullName):
            var parameters = ["token": token]
            if let _fullName = fullName {
                parameters["fullName"] = _fullName
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getInitData(session):
            let parameters = ["session": session]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getSubscriptionAudios(session, unread, page):
            let parameters = ["session": session,
                              "unread": unread ? "1" : "0",
                              "page": String(page)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getSubscriptions(session, order):
            let parameters = ["session": session,
                              "order": order.rawValue]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getAudiosLiveList(session):
            let parameters = ["session": session,
                              "idLiveList": "1"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getLikedAudios(session, page):
            let parameters = ["session": session,
                              "page": String(page)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .getPendingAudios(session, page):
            let parameters = ["session": session,
                              "page": String(page)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .listsByUser(session):
            let parameters = ["session": session,
                              "version": "2",
                              "output": "100"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .audiosByList(session, listID, page):
            let parameters = ["session": session,
                              "list_id": listID,
                              "page": String(page)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
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
