//
//  CoreDataManager.swift
//
//
//  Created by Doruk Çoban on 11.07.2021.
//

import CoreData

public struct CoreDataManager {
    
    // MARK: - Endpoints
    static func create<T:NSManagedObject>(closure: (T) -> Void)  {
        let container = CoreDataWorker.shared
        let entity = container.entity
        container.containerName = container.containerName(for: T.self)
        closure(entity as! T)
        container.saveContext()
    }
    
    static func create<T:NSManagedObject>() -> T {
        let container = CoreDataWorker.shared
        let entity = container.entity
        container.containerName = container.containerName(for: T.self)
        return entity as! T
    }
    
    static func update<T:NSManagedObject>(_ entity: T, closure: (T) -> Void) {
        let container = CoreDataWorker.shared
        container.containerName = container.containerName(for: T.self)
        closure(entity)
        container.saveContext()
    }
    
    static func delete<T:NSManagedObject>(_ entity: T) {
        let container = CoreDataWorker.shared
        container.containerName = container.containerName(for: T.self)
        container.deleteEntity(entity)
    }
    
    static func fetchItems<T:NSManagedObject>() -> [T] {
        let container = CoreDataWorker.shared
        container.containerName = container.containerName(for: T.self)
        let request = NSFetchRequest<T>(entityName: container.containerName)
        guard let fetched = try? container.context.fetch(request) else {
            return LogManager.log(
                event: .warning,
                defaultValue: [],
                isExtension: true,
                message: "Couldn't fetch data from container. Returning [] instead of crash...")
        }
        return fetched
    }
}

fileprivate class CoreDataWorker {
    
    // MARK: - Shared instance
    static let shared = CoreDataWorker()
    
    private init() {}
    
    // MARK: - Properties
    lazy var entityDescription = NSEntityDescription.entity(forEntityName: containerName, in: context)
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores() { result, error in
            print(result.description)
            guard let error = error else { return }
            print(error.localizedDescription)
        }
        return container
    }()
    
    var containerName = String()
    
    // MARK: - Computed properties
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var entity: NSManagedObject {
        guard let description = entityDescription else { fatalError() }
        return NSManagedObject(entity: description, insertInto: context)
    }
    
    // MARK: - Worker methods
    func containerName(for model: NSManagedObject.Type) -> String {
        NSStringFromClass(model).components(separatedBy: ".").last ?? ""
    }

    func deleteEntity(_ entity: NSManagedObject) {
        context.delete(entity)
        saveContext()
    }
    
    func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("Couldn't save context, \(error.localizedDescription)")
        }
    }
}

