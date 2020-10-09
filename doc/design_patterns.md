# Design patterns

* [Singleton](#singleton)
* [Factory](#factory)
* [Abstract Factory](#abstract-factory)
* [Builder](#builder)
* [Iterator](#iterator)
* [Observer](#observer)
* [Repository](#repository)

---

Design patterns are reusable solutions to common problems in software design.

They help you create loosely coupled code so that you can change or replace components in your code easily and with confidence.

## Singleton

**Singleton** is a **creational design pattern** that ensures that only one instance exists for a given class and that there’s a global access point to that instance.

It usually uses lazy loading to create the single instance when it’s needed the first time.

## Factory

**Factory** is a **creational design pattern** that encapsulates the object creation process and users can simply pass in parameters to a generic factory class without knowing how the objects are actually being created. It allows subclasses to alter the type of objects that will be created.

## Abstract Factory

**Abstract Factory** is a **creational design pattern** that lets you produce families of related objects without specifying their concrete classes.

## Builder

**Builder** is a **creational design pattern** that lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code.

*Abstract Factory* returns the product immediately, whereas *Builder* lets you run some additional construction steps before fetching the product.

## Iterator

**Iterator** is a **behavioral design pattern** that allows sequential traversal through a complex data structure without exposing its internal details.

## Observer

**Observer** is a **behavioral design pattern** where one object notifies other objects of any state changes.

## Repository

**Repository** is an **structural design pattern** that provides an abstraction of data, so that your application can work with a simple abstraction that has an interface. Using this pattern keeps domain objects persistence ignorant.
