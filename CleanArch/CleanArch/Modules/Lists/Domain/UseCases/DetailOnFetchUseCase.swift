//
//  DetailOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

struct DetailOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = (itemTitle: String, itemID: Int, page: UInt)
    typealias Response = DetailInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(with params: (itemTitle: String, itemID: Int, page: UInt), completion: @escaping Handler<DetailInteractor.BussinessObject>) {
        // Cached data
        let items = repository.fetchItemDetail(params.itemID)
        do {
            let bo = try DetailBOMapper().map(input: (params.itemTitle, items, UInt(items?.count ?? 0)))
            completion(.success(bo))
        }
        catch {
            completion(.failure(error))
        }

        // Remote data
        repository.requestItemDetail(username: "laura-digio", page: params.page) { count in
            do {
                let items = self.repository.fetchItemDetail(params.itemID)
                let bo = try DetailBOMapper().map(input: (params.itemTitle, items, count))
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
