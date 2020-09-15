//
//  NetworkClient.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import RxSwift

class NetworkClient: SessionManager {
    static let sharedInstance = NetworkClient()

    init() {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = TimeInterval(NetworkClientConstants.timeout)

        super.init(configuration: sessionConfiguration)
    }

    func rx_request<T: BaseMappable>(_ endpoint: URLRequestConvertible) -> Single<T> {
        return Single<T>.create { [weak self] observer in
            let myRequest = self?.request(endpoint)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<T>) in
                    if response.result.isSuccess {
                        observer(.success(response.result.value!))
                    } else {
                        observer(.error(response.error!))
                    }
                })

            debugPrint(myRequest as Any)

            return Disposables.create {
                myRequest?.cancel()
            }
        }
    }
}
