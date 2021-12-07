//
//  UserCoreData+CoreDataProperties.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 6/12/21.
//
//

import Foundation
import CoreData


extension UserCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreData> {
        return NSFetchRequest<UserCoreData>(entityName: "UserCoreData")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?

}

extension UserCoreData : Identifiable {

}
