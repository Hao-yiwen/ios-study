//
//  Qrcode+CoreDataProperties.swift
//  
//
//  Created by 郝宜文 on 2024/6/19.
//
//

import Foundation
import CoreData


extension Qrcode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Qrcode> {
        return NSFetchRequest<Qrcode>(entityName: "Qrcode")
    }

    @NSManaged public var qrcode: String?
    @NSManaged public var describe: String?

}
