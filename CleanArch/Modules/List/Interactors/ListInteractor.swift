//
//  ListInteractor.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

enum ListInteractorState {
    case idle, loading, data, dataNoRefresh, nodata, connectionErrorWithoutData, connectionErrorWithData
}

class ListInteractor {
z
    private let repository: Repository
    private let bag = DisposeBag()

    private let results: Results<ListItem>
    private var dataChanged: NotificationToken?

    private let lastError = BehaviorSubject<Error?>(value: nil)
    private let numberOfElements = BehaviorSubject<(elements: Int, refresh: Bool)>(value: (0, false))

    let dataManager: ListDataManager

    private let _showRefresh = BehaviorSubject<Bool>(value: false)
    var showRefresh: Observable<Bool> {
        return _showRefresh.asObservable()
    }

    private let _state = BehaviorSubject(value: ListInteractorState.idle)
    var state: Observable<ListInteractorState> {
        return _state.asObservable()
    }

    private let _refreshData = BehaviorSubject(value: false)
    var refreshData: Observable<Bool> {
        return _refreshData.asObservable()
    }

    init(repository: Repository) {
        self.repository = repository

        results = repository.fetchEvents()
        dataManager = ListDataManager(data: Array(results))
        numberOfElements.asObservable()
            .skip(1)
            .do(onNext: { [weak self] elements in
                guard let strongSelf = self else { return }
                
                var state: EventsInteractorState = .idle
                
                if let error = try? strongSelf.lastError.value(), error.isConnectionError() {
                    state = elements.elements > 0 ? .connectionErrorWithData : .connectionErrorWithoutData
                } else {
                    state = elements.elements > 0 ? (elements.refresh ? .data : .dataNoRefresh) : .nodata
                }
                
                strongSelf._state.onNext(state)
                strongSelf.dataSource.data = Array(strongSelf.results)
                strongSelf._refreshData.onNext(true)
            }).subscribe().disposed(by: bag)
        
        addRealmRefreshToken(results)
    }

    deinit {
        dataChanged?.invalidate()
    }
}

extension ListInteractor {

    private func addRealmRefreshToken(_ results: Results<Event>) {
        dataChanged = results.observe { [weak self] change in
            switch change {
                case .initial(_):
                    if let elements = self?.results.count, elements > 0 {
                        self?.numberOfElements.onNext((elements, false))
                }
                default:
                    self?.lastError.onNext(nil)
                    self?.numberOfElements.onNext((self?.results.count ?? 0, true))
            }
        }
    }

    func requestData(manual: Bool = false) {
        repository.requestEvents()
            .observeOn(MainScheduler.instance)
            .subscribe(onError: { [weak self] error in
                self?.lastError.onNext(error)
                self?._showRefresh.onNext(false)
                self?.numberOfElements.onNext((self?.results.count ?? 0, true))
            }, onCompleted: { [weak self] in
                self?.lastError.onNext(nil)
                self?.numberOfElements.onNext((self?.results.count ?? 0, true))
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self?._showRefresh.onNext(false)
                })
            }).disposed(by: bag)
    }

}
