# Data propagation

![RxSwift](rxswift.png)

Communication between layers:
1. Presenter executes a use case that returns an Observable.
2. This Observable is created on data layer and passed by domain layer.
3. Presenter subscribes to this Observable to fetch the result from the repository.
