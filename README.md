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

Fetches all entities and returns as T

    var items: [T] = coreDataManager.fetchAll()
    
<br />

- `create()`

Creates an entity and returns it as type T

    let entity = coreDataManager.create()
        
Do not forget to update attributes after creation of an entity.

<br />

- `updateAttributes(of entity: T, closure: (T) -> Void)`

Creates a closure where attributes of given entity can be updated.

    let entity = coreDataManager.create()
    
    coreDataManager.updateAttributes(of: entity) { 
        $0.name = "Doruk"
    }
    
<br />

- `delete(_ entity: T)`

Deletes the given NSManagedObject

    coreDataManager.delete(entity)
        
