# CoreDataManager-Swift
=====================

The most basic CoreData Manager in swift

How to use it? 
------------

Copy the file `CoreDataManager.swift` into your project.

Create instance from anywhere you want to use. Do not forget to implement NSManagedObject into

- `let coreDataManager = CoreDataManager<T>()`

Functions
------------

- `fetchAll()`

        var items: [T] = coreDataManager.fetchAll()

Fetches all entities and returns as T
       
<br />
<br />

- `create()`

Creates an entity and returns it as type T

        let entity = coreDataManager.create()
        
Do not forget to update attributes after creation of an entity.

<br />
<br />

- `updateAttributes(entity: T, closure: (T) -> Void)`

Creates a closure where attributes of given entity can be updated.

        coreDataManager.updateAttributes(entity: entity) { entity in 
            entity.name = "Test"
        }
<br />
<br />

- `delete(_ entity: T)`

Deletes the given NSManagedObject

        coreDataManager.delete(entity)
        
