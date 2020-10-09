# RxSwift

* [Stream](#stream)
* [Sequence](#sequence)
* [Observable](#observable)
  - [Observable Life Cycle](#observable-life-cycle)
  - [Creating Observable](#creating-observable)
* [Observer](#observer)
* [Subscription](#subscription)
* [Subject](#subject)
  - [Publish Subject](#publish-subject)
  - [Behaviour Subject](#behaviour-subject)
  - [Replay Subject](#replay-subject)
* [Dispose bag](#dispose-bag)

---

**ReactiveX** for Swift.

ReactiveX, also known as **R**eactive E**x**tensions or RX, is a library for composing **asynchronous** and event-based programs by using **observable sequences**.

**Declarative programming** is a programming paradigm -**style**- that consists of instructing the app on **what** needs to be done, instead of telling it how to do it.

**Reactive programming** is a declarative programming paradigm concerned with data streams and the propagation of change. Using reactive programming your app can react to changes in the underlying data without you telling it to do so. This makes it easier to focus on the logic rather than maintaining a particular **state**.

## Stream

A **stream** is a sequence of ongoing events ordered in time, that may or may not end.

## Sequence

A **sequence** is a list of values that you can step through one at a time. We can use it to create custom collection types.

## Observable

Every Observable sequence is just a sequence. The key advantage for an Observable vs Swift's Sequence is that it can also receive elements **asynchronously**. This is the kernel of *RxSwift*.

### Observable Life Cycle

- **.next** → An event that carries the latest data value.
- **.completed** → This event terminates the event sequence with success. It won’t emit additional events after complete.
- **.error** → The Observable terminates with an error and will not emit additional events.
- **.dispose** → This event explicitly cancels a subscription, so the observable will stop emitting events.
    - The *.completed* and *.error* will **automatically** call this method.

### Creating Observable

A **hot** Observable may begin emitting items as soon as it is created. A **cold** Observable waits until an observer subscribes to it before it begins to emit items.

- **just** → Create an observable sequence containing just a single element.
- **deferred** → do not create the Observable until the observer subscribes, and create a fresh Observable for each subscription.
- **of** → Convert any swift type to its corresponding Observable sequence.
- **from** → Creates an observable of individual elements from an array of typed elements.
    - The *from* operator only takes an array.
- **create** → Most flexible operator to create an Observable. You can make any library function reactive using create operator.
    - In this case, since we are creating custom Rx observable, we need to free up the memory by calling **.dispose** manually.
    - There is a **dispose bag** feature in *RxSwift*.

## Observer

An observer can subscribe to observable sequences to receive asynchronous notifications as new data arrive to perform some operation.

Observer bind with observable through **subscription**.

## Subscription

- **.subscribe** → Start observing an observable.

## Subject

A **Subject** acts as both an Observable and Observer. You will be using Subject in most cases in your app.

Since it is an observer, it can subscribe to one or more Observables and also is an Observer, and hence, it can pass through the items it observes by re-emitting them.

It can also emit new items instead of acting as a middle.

### Publish Subject

A **PublishSubject** starts empty and only emits new elements to its subscribers.

### Behaviour Subject

A **BehaviourSubject** will **replay** the latest **.next** event to new subscribers and it must start with some initial value.

The concept of emitting previous next events to new subscribers is called replaying.

### Replay Subject

A **ReplaySubject** replays more than the most recent element on a sequence to new subscribers.

## Dispose bag

The disposable returned by the Subscribe extension methods is returned solely to allow you to manually unsubscribe from the observable before the observable naturally ends. If the observable completes — with either OnCompleted or OnError — then the subscription is already disposed for you.

**DisposeBag** is collection of disposables. When you subscribe to any observables you add disposables to this bag. When the disposeBag is deallocated, its deinit function calls dispose on all of the disposables it contains.

- Don’t create a dispose bag in one class, and share it with another class.
- You should always add your subscriptions to a DisposeBag, even if you know your sequences will surely terminate.
- Official suggestion is to always use **.disposed(by: disposeBag)** even though that's not necessary for simple bindings.
