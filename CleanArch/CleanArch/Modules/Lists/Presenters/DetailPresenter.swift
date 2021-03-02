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

    init(interactor: DetailInteractor) {
        self.interactor = interactor
    }
}

extension DetailPresenter: DetailViewOutput {

    func onFetch() {
        interactor.onFetch { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
}

private extension DetailPresenter {

    func processResult(_ result: Result<DetailInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let businessObject):
            do {
                let viewObject = try DetailVOMapper().map(input: businessObject)
                viewInput?.refresh(viewObject)
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
