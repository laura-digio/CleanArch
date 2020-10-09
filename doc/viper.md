# VIPER

* [View](#view)
* [Interactor](#interactor)
* [Presenter](#presenter)
* [Entity](#entity)
  - [Repository](#repository)
* [Router / Wireframe](#router-/-wireframe)
* [Assembly](#assembly)
  - [Dependency Injection](#dependency-injection)
* [DataManager](#datamanager)

---

**V**iew, **I**nteractor, **P**resenter, **E**ntity, **R**outer

**VIPER** is an implementation of **Clean Architecture** oriented to iOS apps, based on the **Single responsibility principle** of **SOLID** software design principles.

By applying VIPER, we separate the files or classes into components that can change independently of other components. Each block corresponds to an object with specific tasks, inputs, and outputs.

![Uncle Bob](doc/clean_architecture.png)

## View

This is the **UI** layer, the most external. It draws the orders sent by the **Presenter** and also asks it what to do in response to user inputs.

`Modules/Settings/Views/SettingsViewController.swift`

```swift
class SettingsViewController: UIViewController {
    private let presenter: SettingsPresenter
    private let bag: DisposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    init(presenter: SettingsPresenter) {
        self.presenter = presenter
        
        super.init(nibName: String.init(describing: type(of: self)), bundle: Bundle.init(for: type(of: self)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = presenter.dataManager
        tableView.delegate = presenter.dataManager 
    }

    func userWantsToShowAnotherViewController() {
        presenter.userWantsToShowAnotherViewController(navigationController)
    }
}
```

## Interactor

This layer contains the business logic of the **use cases**. Here we manipulate **Entities** (models) to carry out a specific task, using the **Repository** pattern to encapsulate **network calls** and **DB queries**.

`Modules/Settings/Interactors/SettingsInteractor.swift`

```swift
class SettingsInteractor {
    private let repository: Repository
    private let settingsModel: Settings
    private let bag = DisposeBag()
    
    let dataManager: SettingsDataManager
    
    init(repository: Repository) {
        self.repository = repository
        self.settingsModel = Settings()
        self.dataManager = SettingsDataManager(data: settingsModel)
    }

    func requestMySetting() {
        repository.requestMySetting().subscribe(onSuccess: { [weak self] mySetting in
            // handle mySetting
        }).disposed(by: bag)
    }
}
```

## Presenter

This layer tells the **View** what to present once it receives the information from the **Interactor** and it reacts to the actions of the **View** in order to ask for data or navigation.

`Modules/Settings/Presenters/SettingsPresenter.swift`

```swift
class SettingsPresenter {
    private let interactor: SettingsInteractor
    private let wireframe: SettingsWireframe
    
    var dataManager: SettingsDataManager {
        return interactor.dataManager
    }
    
    init(interactor: SettingsInteractor, wireframe: SettingsWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }

    func userWantsToShowAnotherViewController(context: UINavigationController) {
        wireframe.showAnotherViewController(context)
    }
}
```

## Entity

This layer contains the **models** used by the **Interactor**.

- `Models/Repository/`
- `Models/Domain/`
- `Models/Realm/`

### Repository

**Repository** is a **design pattern** that provides an abstraction of data. It allows us to abstract the domain layer from the data layer and also, inside data layer, the data repository from its data sources.

![Repository](doc/repository.png)

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

`Models/Repository/Repository+Settings.swift`

```swift
extension Repository {

    func fetchMySetting(identifier: Int) -> MySetting? {
        return try! Realm().objects(MySetting.self).filter(NSPredicate(format: "id = %d", identifier)).first
    }

    func requestMySetting() -> Single<MySetting> {
        let endpoint = MySettingEndpoint()
        return NetworkClient.sharedInstance.rx_request(endpoint).flatMap(saveMySetting)
    }

    private func saveMySetting(_ mySetting: MySetting) -> Single<MySetting> {
        return Single.create { single in
            let realm = try Realm()
            try realm.write {
                realm.add(mySetting, update: .modified)
            }
            return Disposables.create()
        }
    }
}
```

## Router / Wireframe

This layer is responsible for handling all the **navigation** between scenes.

`Modules/Settings/Wireframes/SettingsWireframe.swift`

```swift
class SettingsWireframe {
    private let assembly = SettingsAssembly()
    private let anotherAssembly = AnotherAssembly()

    func mainViewController() -> UIViewController {
        return assembly.viewSettingsModuleWithWireframe(self)
    }

    func showAnotherViewController(context: UINavigationController) {
        let vc = anotherAssembly.viewAnotherWithWireframe(AnotherWireframe())
        context.pushViewController(vc, animated: true)
    }
}
```

## Assembly

This layer is responsible for creating and setting up modules.

It **builds** the module and **injects** its dependencies in the constructor.

`Modules/Settings/Assembly/SettingsAssembly.swift`

```swift
class SettingsAssembly {
    private let repository = Repository.sharedInstance
    
    func viewSettingsModuleWithWireframe(_ wireframe: SettingsWireframe) -> UIViewController {
        let interactor = SettingsInteractor(repository: repository)
        let presenter = SettingsPresenter(interactor: interactor, wireframe: wireframe)
        let vc = SettingsViewController(presenter: presenter)
        
        return vc
    }
}
```

### Dependency Injection

**Dependency Injection (DI)** is a technique to apply the **Dependency inversion principle** of **SOLID** software design principles: 

Abstractions should not depend on details. Details should depend on abstractions.

**DI** means giving an object its instance variables.

Although there are DI libraries, we manually inject dependencies in the constructor when we build each module.

## DataManager

This layer encapsulates the **DataSource** and **Delegate** of the components that compose de UI.

`Modules/Settings/DataManagers/SettingsDataManager.swift`

```swift
class SettingsDataManager: UITableViewDataSource, UITableViewDelegate {
    var data: Settings

    init(data: Settings) {
        self.data = data
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
```

`Models/Domain/Settings.swift`

```swift
struct Settings {
    var sections: [SettingsSection]
}

struct SettingsSection {
    var items: [SettingsItem]
    
    init(items: [SettingsItem]) {
        self.items = items
    }
}

struct SettingsItem {
    var title: String
    var subtitle: String?
    
    init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
}

```
