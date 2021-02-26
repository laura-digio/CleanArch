//
//  PlaylistsOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

struct PlaylistsOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = Void
    typealias Response = PlaylistsInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(completion: @escaping Handler<PlaylistsInteractor.BussinessObject>) {
        // Cached data
        if let items = repository.fetchPlaylists() {
            do {
                let bo = try PlaylistsBOMapper().map(input: items)
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }

        // Remote data
        repository.requestPlaylists(session: "70913185600310") { count in
            do {
                let items = self.repository.fetchPlaylists()
                let bo = try PlaylistsBOMapper().map(input: items)
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
