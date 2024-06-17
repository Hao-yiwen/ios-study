//
//  store.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ios_study")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreDataStack: Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("CoreDataStack: Unable to save context: \(error)")
            }
        }
    }
    
    func delete(_ object: NSManagedObject) {
        viewContext.delete(object)
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let request = NSFetchRequest<T>(entityName: String(describing: objectType))
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        do {
            return try viewContext.fetch(request)
        } catch {
            fatalError("CoreDataStack: Unable to fetch objects with error: \(error)")
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, limit: Int) -> [T] {
        let request = NSFetchRequest<T>(entityName: String(describing: objectType))
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = limit
        
        do {
            return try viewContext.fetch(request)
        } catch {
            fatalError("CoreDataStack: Unable to fetch objects with error: \(error)")
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, limit: Int, offset: Int) -> [T] {
        let request = NSFetchRequest<T>(entityName: String(describing: objectType))
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = limit
        request.fetchOffset = offset
        
        do {
            return try viewContext.fetch(request)
        } catch {
            fatalError("CoreDataStack: Unable to fetch objects with error: \(error)")
        }
    }
}
