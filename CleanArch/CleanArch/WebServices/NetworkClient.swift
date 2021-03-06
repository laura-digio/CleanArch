//
//  NetworkClient.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import Moya
import Alamofire

struct NetworkClient {
    #if DEBUG
    private static let plugins = [NetworkLoggerPlugin(configuration: .init(logOptions: .requestMethod))]
    let provider = MoyaProvider<GitHubAPI>(session: DefaultAlamofireManager.sharedManager,
                                           plugins: plugins)
    #else
    let provider = MoyaProvider<GitHubAPI>(session: DefaultAlamofireManager.sharedManager)
    #endif

    var cRequestListItems: Cancellable?
    var cRequestDetail: Cancellable?
}

class DefaultAlamofireManager: Alamofire.Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForRequest = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}
