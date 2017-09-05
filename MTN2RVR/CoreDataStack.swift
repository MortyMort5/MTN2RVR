//
//  CoreDataStack.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {

    static let container: NSPersistentContainer =  {
        let container = NSPersistentContainer(name: "MTN2RVR")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error loading persistent stores: \(error.userInfo)")
            }
        })
        return container
    }()

    static var context: NSManagedObjectContext {return container.viewContext}
}
