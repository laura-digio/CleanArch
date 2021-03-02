//
//  ListPresenter.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

class ListPresenter: BasePresenter {
    var viewInput: ListViewInput?
    var wireframeInput: ListWireframeInput?

    private let interactor: ListInteractor

    init(interactor: ListInteractor) {
        self.interactor = interactor
    }
}

extension ListPresenter: ListViewOutput {

    func onFetch() {
        interactor.onFetch { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
    func detailView(_ item: ListItem) -> DetailView? {
        wireframeInput?.detailView(item)
    }
}

private extension ListPresenter {

    func processResult(_ result: Result<ListInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let businessObject):
            do {
                let viewObject = try ListVOMapper().map(input: businessObject)
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
