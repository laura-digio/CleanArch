//
//  Repository.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * Repository pattern:
 * Abstracting the access to the data layer in a way that the business layer (use cases)
 * can ignore the sources from where the data is coming.
 * - Sources: DB / File / Web service
 * We'll have at most one repository for each entity in the domain.
 */

import Foundation
import Moya
import RealmSwift
import ObjectMapper

public class Repository {
    static let shared = Repository() // SINGLETON (must be a CLASS)

    var networkClient = NetworkClient()
    var databaseClient = DatabaseClient()

    var appState: AppState = UserDefaults.appState ?? AppState()
}

extension Repository {

    func reset() {
        do {
            try databaseClient.realm?.write({
                databaseClient.realm?.deleteAll()
            })
        } catch {
            #if DEBUG
            debugPrint(error)
            #endif
        }
    }
}

// MARK: - Generic parsers

protocol Model: Object, Mappable, Codable {
    var remoteSorting: Int { get set }
    var itemID: Int { get set }
}

extension Repository {
    func parseItems<T: Model>(model: T.Type,
                              result: Result<Response, MoyaError>,
                              keyPath: String? = nil,
                              shouldRefresh: Bool = true,
                              callback: @escaping (UInt) -> Void) {
        switch result {
        case let .success(response):
            do {
                var items: [T]?
                if let keyPath = keyPath {
                    if let json = (try response.mapJSON(failsOnEmptyData: false) as? NSDictionary)?
                        .value(forKeyPath: keyPath) {
                        items = parsedJSON(model: T.self, json: json)
                    }
                } else {
                    let json = try response.mapJSON(failsOnEmptyData: false)
                    items = parsedJSON(model: T.self, json: json)
                }

                if let items = items {
                    try databaseClient.realm?.write({
                        var parsedItems: [Int] = []
                        var count = shouldRefresh ? 1 : (databaseClient.realm?.objects(T.self).count ?? 0) + 1
                        items.forEach { item in
                            if let newItem = databaseClient.realm?.create(T.self, value: item, update: .all) {
                                newItem.remoteSorting = count
                                parsedItems.append(newItem.itemID)
                                count += 1
                            }
                        }

                        // Sync local with remote
                        if shouldRefresh {
                            if let oldItems = databaseClient.realm?.objects(T.self)
                                .filter(NSPredicate(format: "NOT itemID IN %@", parsedItems)) {
                                databaseClient.realm?.delete(oldItems)
                            }
                        }

                        callback(UInt(items.count))
                    })
                } else {
                    callback(0)
                }
            } catch {
                #if DEBUG
                debugPrint(error)
                #endif

                callback(0)
            }
        case .failure:
            callback(0)
        }
    }
}

private extension Repository {
    func parsedJSON<T: Model>(model: T.Type, json: Any) -> [T]? {
        if let item = Mapper<T>().map(JSONObject: json) {
            return [item]
        } else {
            return Mapper<T>().mapArray(JSONObject: json)
        }
    }
}
