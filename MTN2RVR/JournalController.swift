//
//  JournalController.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

class JournalController {
    static let shared = JournalController()

    var journals: [Journal] {
        let request: NSFetchRequest<Journal> = Journal.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }

    func create(journalWithCityName cityName: String, creationDate: Date, journalType: String, location: NSData, name: String, notes: String, onFire: String, riverLevel: String, stateName: String, tempurature: Int32, waterColor: String, waterSpeed: String, workingFlies: String, user: User) {
        let _ = Journal(cityName: cityName, creationDate: creationDate, journalType: journalType, location: location, name: name, notes: notes, onFire: onFire, riverLevel: riverLevel, stateName: stateName, temperature: tempurature, waterColor: waterColor, waterSpeed: waterSpeed, workingFlies: workingFlies, user: user)
        UserController.shared.saveToPersistentStore()
    }

    func delete(journal: Journal) {
        if let moc = journal.managedObjectContext {
            moc.delete(journal)
            UserController.shared.saveToPersistentStore()
            
        }
    }
}
