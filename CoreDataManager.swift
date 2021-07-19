//
//  CoreDataManager.swift
//  GetirTodo
//
//  Created by Doruk Çoban on 11.07.2021.
//

import CoreData

final class CoreDataManager<T: NSManagedObject> {
    
    // MARK: - Properties
    
    private var containerName: String
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores() { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Init
    
    required init() {
        containerName = NSStringFromClass(T.self)
    }
    
    // MARK: - Functions
    
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func create() -> T {
        let description = NSEntityDescription.entity(forEntityName: containerName, in: context)!
        let entity = T(entity: description, insertInto: context)
        return entity
    }
    
    func updateAttributes(entity: T, closure: (T) -> Void) {
        closure(entity)
        saveContext()
    }
    
    func delete(_ entity: T) {
        context.delete(entity)
        saveContext()
    }
    
    func fetchAll() -> [T] {
        do {
            return try context.fetch(T.fetchRequest()) as! [T]
        }
        catch {
            let error = error as NSError
            print("Unresolved error \(error), \(error.userInfo)")
            return []
        }
    }
    
}
