# Three-tier architecture

* [Presentation](#presentation)
* [Domain](#domain)
* [Data](#data)

---

One of the most common ways to structure an app is using 3-tier architecture so that we separate it into three broad layers -presentation (UI), domain logic (aka business logic), and data access-.

![3-tier](layers.png)

## Presentation

This is the topmost level of the application. The presentation tier is a layer which users can access directly (such as a **GUI**).

## Domain

The domain tier controls an application's functionality (also known as **business logic**) by performing detailed processing.

## Data

The data tier includes the data **persistence** mechanisms (database, file system, etc.) and the data access layer that encapsulates the persistence mechanisms and exposes the data.

# See also

* [Dependency Rule](/doc/propagation.md#dependency-rule)
  - [Presentation Layer](/doc/propagation.md#presentation-layer)
  - [Domain Layer](/doc/propagation.md#domain-layer)
    * [Repository Interface](/doc/propagation.md#repository-interface)
  - [Data Layer](/doc/propagation.md#data-layer)
    * [Repository Implementation](/doc/propagation.md#repository-implementation)
