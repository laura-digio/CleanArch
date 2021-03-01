//
//  DetailPresenter.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

class DetailPresenter: BasePresenter {
    var viewInput: DetailViewInput?
    var wireframeInput: DetailWireframeInput?

    private let interactor: DetailInteractor

    private var ssot: [ItemDetail] = []
    private var page: UInt = 1
    private var isLastPage: Bool = false

    init(interactor: DetailInteractor) {
        self.interactor = interactor
    }
}

extension DetailPresenter: DetailViewOutput {

    func onFetch(condition: Int?) {
        if let itemID = condition {
            if isLastPage || ssot.last?.id != itemID {
                return
            }
        }
        else {
            page = 1
            ssot.removeAll()
            isLastPage = false
        }

        interactor.onFetch(page: page) { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
}

private extension DetailPresenter {

    func processResult(_ result: Result<DetailInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let bo):
            do {
                let vo = try DetailVOMapper().map(input: bo)

                if let items = vo.items {
                    ssot = Array(items)
                }
                isLastPage = !vo.loading
                page += vo.loading ? 1 : 0

                viewInput?.refresh(vo)
            } catch {
                processFailure(error)
            }

        case .failure(let error):
            processFailure(error)
        }
    }

    func processFailure(_ error: Error) {
        #if DEBUG
        debugPrint(error.localizedDescription)
        #endif
    }
}
