//
//  TodayListOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

struct TodayListOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = Void
    typealias Response = TodayListInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(completion: @escaping Handler<TodayListInteractor.BussinessObject>) {
        // Cached data
        if let items = repository.fetchTodayListAudios() {
            do {
                let bo = try TodayListBOMapper().map(input: items)
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }

        // Remote data
        repository.requestTodayListAudios(session: "70913185600310") { count in
            do {
                let audios = repository.fetchTodayListAudios()
                let bo = try TodayListBOMapper().map(input: audios)
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
