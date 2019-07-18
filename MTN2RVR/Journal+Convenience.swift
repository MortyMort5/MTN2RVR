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
    @discardableResult convenience init(cityName: String, timestamp: Date = Date(), latitude: Double, longitude: Double, name: String, notes: String, onFire: Int, riverLevel: String, stateName: String, temperature: Int, waterColor: String, waterSpeed: Int, workingFlies: [String], context: NSManagedObjectContext = Stack.context) {
        self.init(context: context)
        self.cityName = cityName
        self.timestamp = timestamp
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.notes = notes
        self.onFire = Int32(onFire)
        self.riverLevel = riverLevel
        self.stateName = stateName
        self.temperature = Int32(temperature)
        self.waterColor = waterColor
        self.waterSpeed = Int32(waterSpeed)
        self.workingFlies = workingFlies as NSArray
    }
}
