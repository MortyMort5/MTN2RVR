//
//  Journal+Convenience.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

extension Journal {
    @discardableResult convenience init(cityName: String, creationDate: Date = Date(), journalType: String = "Fishing", location: NSData, name: String, notes: String, onFire: String, riverLevel: String, stateName: String, temperature: Int32, waterColor: String, waterSpeed: String, workingFlies: String, user: User, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.cityName = cityName
        self.creationDate = creationDate as NSDate
        self.journalType = journalType
        self.location = location
        self.name = name
        self.notes = notes
        self.onFire = onFire
        self.riverLevel = riverLevel
        self.stateName = stateName
        self.temperature = temperature
        self.waterColor = waterColor
        self.waterSpeed = waterSpeed
        self.workingFlies = workingFlies
        self.user = user
    }
}
