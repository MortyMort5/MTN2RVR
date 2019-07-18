//
//  CoreDataStack.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

enum Stack {

    static let container: NSPersistentContainer = {
        
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    static var context: NSManagedObjectContext {return container.viewContext}
}
