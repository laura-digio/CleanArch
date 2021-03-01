//
//  DatabaseClient.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import RealmSwift

struct DatabaseClient {

    var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            print(error)
            return nil
        }
    }

    init() {
        setupRealm(databaseName: "db")
    }

    private func setupRealm(databaseName: String) {
        var config = Realm.Configuration(schemaVersion: 1, migrationBlock: migrateIfNeeded)
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(databaseName).realm")
        Realm.Configuration.defaultConfiguration = config
    }

    private func migrateIfNeeded(migration: Migration, oldSchemaVersion: UInt64) {}
}
