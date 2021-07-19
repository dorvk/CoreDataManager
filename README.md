# CoreDataManager for Swift

A manager for the basic use of CoreData 

How to use
------------

Copy the file `CoreDataManager.swift` into your project.

Create instance from anywhere you want to use. You don't need to `import CoreData` anywhere, nor AppDelegate configurations. Just do not forget to implement NSManagedObject while initialization.

    let coreDataManager = CoreDataManager<T>()

Functions
------------

- `fetchAll()`

Fetches all entities and returns an array of T

    let coreDataManager = CoreDataManager<T>()
    
    var items: [T] = coreDataManager.fetchAll()
    
<br />

- `create()`

Creates an entity and returns it as T where T is NSManagedObject

    let coreDataManager = CoreDataManager<T>()
    
    let entity = coreDataManager.create()
    
<br />
        
- `create(closure: (T) -> Void)`

Creates an entity with closure to update it's attributes.

    let coreDataManager = CoreDataManager<T>()
    
    coreDataManager.create() { 
        $0.name = "Doruk"
    }

<br />

- `update(_ entity: T, closure: (T) -> Void)`

Creates a closure where attributes of given entity can be updated.

    let coreDataManager = CoreDataManager<T>()

    let entity = coreDataManager.create()
    
    coreDataManager.update(entity) { 
        $0.name = "Doruk"
    }
    
<br />

- `delete(_ entity: T)`

Deletes the given NSManagedObject

    let coreDataManager = CoreDataManager<T>()  
 
    coreDataManager.delete(entity)
        
