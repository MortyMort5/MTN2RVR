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
        return (try? Stack.context.fetch(request)) ?? []
    }

    func create(cityName: String, latitude: Double, longitude: Double, name: String, notes: String, onFire: Int, riverLevel: String, stateName: String, tempurature: Int, waterColor: String, waterSpeed: Int, workingFlies: [String]) {
        
        let _ = Journal(cityName: cityName, latitude: latitude, longitude: longitude, name: name, notes: notes, onFire: onFire, riverLevel: riverLevel, stateName: stateName, temperature: tempurature, waterColor: waterColor, waterSpeed: waterSpeed, workingFlies: workingFlies)
        
        UserController.shared.saveToPersistentStore()
    }

    func delete(journal: Journal) {
        if let moc = journal.managedObjectContext {
            moc.delete(journal)
            UserController.shared.saveToPersistentStore()
        }
    }
}
