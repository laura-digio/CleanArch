//
//  DetailOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

struct DetailOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = (viewTitle: String, username: String)
    typealias Response = DetailInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(with params: (viewTitle: String, username: String), completion: @escaping Handler<DetailInteractor.BussinessObject>) {
        // Cached data
        let item = repository.fetchDetail(params.username)
        do {
            let bo = try DetailBOMapper().map(input: (params.viewTitle, item))
            completion(.success(bo))
        }
        catch {
            completion(.failure(error))
        }

        // Remote data
        repository.requestDetail(params.username) { count in
            do {
                let item = repository.fetchDetail(params.username)
                let bo = try DetailBOMapper().map(input: (params.viewTitle, item))
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
