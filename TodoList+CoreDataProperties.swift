//
//  TodoList+CoreDataProperties.swift
//  apptodolist
//
//  Created by admin on 18/12/2021.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var title: String?
    @NSManaged public var tododesc: String?
    @NSManaged public var duedate: Date?
    @NSManaged public var checkmark: Bool

}

extension TodoList : Identifiable {

}
