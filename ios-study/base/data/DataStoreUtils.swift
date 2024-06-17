//
//  DataStoreUtils.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import CoreData

class DataStoreUtils{
    static func saveData(person: Person){
        let context = CoreDataStack.shared.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context)
        
//        newObject.setValue("John", forKey: "name")
//        newObject.setValue(25, forKey: "age")
        newObject.setValue(person.name, forKey: "name")
        newObject.setValue(person.age, forKey: "age")
        // 保存上下文
        CoreDataStack.shared.saveContext()
    }
    
    static func fetchAllData() -> [Person] {
        return CoreDataStack.shared.fetch(Person.self)
    }
}
