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
    let provider = MoyaProvider<IvooxAPI>(session: DefaultAlamofireManager.sharedManager,
                                          plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .requestMethod))])
    #else
    let provider = MoyaProvider<IvooxAPI>(session: DefaultAlamofireManager.sharedManager)
    #endif

    var cRequestNewEpisodes: Cancellable?
    var cRequestSubscriptions: Cancellable?
    var cRequestTodayListAudios: Cancellable?
    var cRequestLikedAudios: Cancellable?
    var cRequestPendingAudios: Cancellable?
    var cRequestPlaylists: Cancellable?
    var cRequestPlaylistEpisodes: Cancellable?
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
