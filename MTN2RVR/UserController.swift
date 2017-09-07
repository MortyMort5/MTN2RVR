//
//  UserController.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

class UserController {
    static let shared = UserController()

    func createUser(firstName: String, lastName: String, email: String, username: String, uuid: String, profilePicture: Data) {

    }

    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("There was a problem saving to the persistent store: \(error)")
        }
    }
}
