# SOLID principles

* [Single responsibility](#single-responsibility)
* [Open/closed](#open/closed)
* [Liskov substitution](#liskov-substitution)
* [Interface segregation](#interface-segregation)
* [Dependency inversion](#dependency-inversion)

---

**SOLID** is an acronym that represents five principles of **object-oriented programming** and code design theorized by Robert C. Martin (Uncle Bob) by the year 2000. They are intended to make software designs more understandable, flexible and maintainable.

SOLID principles do not tell anything about **state**. They should be applicable as well in **functional programming** languages.

## Single responsibility

A class should have only one reason to change. Gather together the things that change for the same reasons. Separate those things that change for different reasons.

## Open/closed

Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.

Your code should apply to this principle **after** you finish implementing the whole functionality you wanted.

## Liskov substitution

Derived classes must be substitutable for their base classes.

## Interface segregation

Clients should not be forced to depend upon interfaces that they do not use.

## Dependency inversion

1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.
