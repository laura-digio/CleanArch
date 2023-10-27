# Three-layer architecture

* [Presentation](#presentation)
* [Domain](#domain)
* [Data](#data)

---

One of the most common ways to structure an app is using 3-layer architecture so that we separate it into three broad layers -presentation (UI), domain logic (aka business logic), and data access-.

![3-layer](assets/layers.png)

## Presentation

This is the topmost level of the application. The presentation layer is a layer which users can access directly (such as a **GUI**).

## Domain

The domain layer controls an application's functionality (also known as **business logic**) by performing detailed processing.

## Data

The data layer includes the data **persistence** mechanisms (database, file system, etc.) and the data access layer that encapsulates the persistence mechanisms and exposes the data.

# References

- [Martin Fowler - Presentation, Domain, Data layering](https://martinfowler.com/bliki/PresentationDomainDataLayering.html)
