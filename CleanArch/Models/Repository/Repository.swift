//
//  Repository.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import RealmSwift
import Alamofire
import RxSwift

class Repository {

    static let sharedInstance = Repository()
    private let networkClient: NetworkClient = NetworkClient.sharedInstance

    let dbQueue = DispatchQueue(label: "DBQueue")
    let dbScheduler: SerialDispatchQueueScheduler

    var isReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

    init() {
        self.dbScheduler = SerialDispatchQueueScheduler(queue: dbQueue, internalSerialQueueName: "internalDbQueue")
        setupRealm(databaseName: "db")
    }

    private func setupRealm(databaseName: String) {
        var config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: nil
        )
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(databaseName).realm")
        Realm.Configuration.defaultConfiguration = config
    }
}
