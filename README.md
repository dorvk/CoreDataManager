# CoreDataManager for Swift

A manager for the basic use of CoreData 

How to use
------------

Copy the file `CoreDataManager.swift` into your project.

You don't need to `import CoreData` anywhere, nor AppDelegate configurations. Just do not forget to implement NSManagedObject while initialization.

Functions
------------

- `fetchAll()`

Fetches all entities and returns an array of T

    var items: [T] = CoreDataManager.fetchAll()
    
<br />

- `create()`

Creates an entity and returns it as T.

    let entity: T = CoreDataManager.create()
    
<br />
        
- `create(closure: (T) -> Void)`

Creates an entity with closure to update it's attributes.

    CoreDataManager.create() { (entity: T) in
        entity.name = "Doruk"
    }

<br />

- `update(_ entity: T, closure: (T) -> Void)`

Creates a closure where attributes of given entity can be updated.

    let entity: T = CoreDataManager.create()
    
    CoreDataManager.update(entity) { 
        $0.name = "Doruk"
    }
    
<br />

- `delete(_ entity: T)`

Deletes the given NSManagedObject as T

    CoreDataManager.delete(entity)
        
