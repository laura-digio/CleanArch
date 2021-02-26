# VIPER

* [View](#view)
* [Interactor](#interactor)
* [Presenter](#presenter)
* [Entity](#entity)
  - [Repository](#repository)
* [Router / Wireframe](#router--wireframe)
* [Assembly](#assembly)
  - [Dependency Injection](#dependency-injection)
* [DataManager](#datamanager)

---

**V**iew, **I**nteractor, **P**resenter, **E**ntity, **R**outer

**VIPER** is an implementation of **Clean Architecture** oriented to iOS apps, based on the **Single responsibility principle** of **SOLID** software design principles.

By applying VIPER, we separate the files or classes into components that can change independently of other components. Each block corresponds to an object with specific tasks, inputs, and outputs.

![Uncle Bob](clean_architecture.png)

## View

This is the **UI** layer, the most external. It draws the orders sent by the **Presenter** and also asks it what to do in response to user inputs.

## Interactor

This layer contains the business logic of the **use cases**. Here we manipulate **Entities** (models) to carry out a specific task, using the **Repository** pattern to encapsulate **network calls** and **DB queries**.

## Presenter

This layer tells the **View** what to present once it receives the information from the **Interactor** and it reacts to the actions of the **View** in order to ask for data or navigation.

## Entity

This layer contains the **models** used by the **Interactor**.

- `Models/Repository/`
- `Models/Domain/`
- `Models/Realm/`

### Repository

**Repository** is a **design pattern** that provides an abstraction of data. It allows us to abstract the domain layer from the data layer and also, inside data layer, the data repository from its data sources.

![Repository](repository.png)

Since we need to query the model objects from different locations in the code over and over again, a repository provides a single-entry point to work with the models and remove duplicate query code.

`Models/Repository/Repository.swift`

```swift
class Repository {
    static let sharedInstance = Repository()

    init() {
      // Setup Realm DB
    }
}
```

## Router / Wireframe

This layer is responsible for handling all the **navigation** between scenes.

## Assembly

This layer is responsible for creating and setting up modules.

It **builds** the module and **injects** its dependencies in the constructor.

### Dependency Injection

**Dependency Injection (DI)** is a technique to apply the **Dependency inversion principle** of **SOLID** software design principles: 

Abstractions should not depend on details. Details should depend on abstractions.

**DI** means giving an object its instance variables.

Although there are DI libraries, we manually inject dependencies in the constructor when we build each module.
