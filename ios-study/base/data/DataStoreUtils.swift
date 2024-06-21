//
//  DataStoreUtils.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import CoreData

@objc
class DataStoreUtils: NSObject{
    static func savePerson(person: Person){
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
    
    static func fetchAllPerson() -> [Person] {
        return CoreDataStack.shared.fetch(Person.self)
    }
    
    static func saveQrCode(qrcode: Qrcode){
        let context = CoreDataStack.shared.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Qrcode", in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context)
        
        newObject.setValue(qrcode.qrcode, forKey: "qrcode")
        newObject.setValue(qrcode.describe, forKey: "describe")
        CoreDataStack.shared.saveContext()
    }
    
    @objc static func fetchAllQrcode() -> [Qrcode] {
        return CoreDataStack.shared.fetch(Qrcode.self)
    }
}
