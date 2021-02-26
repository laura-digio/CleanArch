//
//  TodayListPresenter.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

class TodayListPresenter: BasePresenter {
    var viewInput: TodayListViewInput?
    var wireframeInput: TodayListWireframeInput?

    private let interactor: TodayListInteractor

    init(interactor: TodayListInteractor) {
        self.interactor = interactor
    }
}

extension TodayListPresenter: TodayListViewOutput {

    func onFetch() {
        interactor.onFetch { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
}

private extension TodayListPresenter {

    func processResult(_ result: Result<TodayListInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let bo):
            do {
                let vo = try TodayListVOMapper().map(input: bo)
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
