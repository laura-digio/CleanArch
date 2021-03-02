//
//  ListOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

struct ListOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = String
    typealias Response = ListInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(completion: @escaping Handler<ListInteractor.BussinessObject>) {
        // Cached data
        if let items = repository.fetchListItems() {
            do {
                let businessObject = try ListBOMapper().map(input: items)
                completion(.success(businessObject))
            } catch {
                completion(.failure(error))
            }
        }

        // Remote data
        repository.requestListItems { _ in
            do {
                let items = self.repository.fetchListItems()
                let businessObject = try ListBOMapper().map(input: items)
                completion(.success(businessObject))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
