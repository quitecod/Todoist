//
//  UserCredentialsEntity+CoreDataProperties.swift
//  sample
//
//  Created by Singh, Balwant on 24/01/24.
//
//

import Foundation
import CoreData


extension UserCredentialsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCredentialsEntity> {
        return NSFetchRequest<UserCredentialsEntity>(entityName: "UserCredentialsEntity")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension UserCredentialsEntity : Identifiable {

}
