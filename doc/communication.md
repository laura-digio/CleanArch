# Communication between layers

![RxSwift](doc/rxswift.png)

Presenter executes a use case that returns an Observable. This Observable is created on data layer and passed by domain layer. Presenter subscribes to this Observable to fetch the result from the repository.
