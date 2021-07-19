# CoreDataManager-Swift
=====================

The most basic CoreData Manager in swift

How to use it? 
------------

Copy the file `CoreDataManager.swift` into your project.

Create instance from anywhere you want to use. You don't need to `import CoreData` anywhere, nor AppDelegate configurations. Just do not forget to implement NSManagedObject while initialization.

    let coreDataManager = CoreDataManager<T>()

Functions
------------

- `fetchAll()`

Fetches all entities and returns an array of T

    var items: [T] = coreDataManager.fetchAll()
    
<br />

- `create()`

Creates an entity and returns it as type T where T is NSManagedObject

    let entity = coreDataManager.create()
    
<br />
        
- `create(closure: (T) -> Void)`

Creates an entity with closure to update it's attributes.

    coreDataManager.create() { 
        $0.name = "Doruk"
    }

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
        
