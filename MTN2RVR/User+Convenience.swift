//
//  User+Convenience.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 9/4/17.
//  Copyright © 2017 Git Swifty. All rights reserved.
//

import Foundation
import CoreData

extension User {
    @discardableResult convenience init(email: String, firstName: String, lastName: String, profileImage: Data, userName: String, uuid: String, journals: Journal, context: NSManagedObjectContext = Stack.context) {
        self.init(context: context)
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
        self.userName = userName
        self.uuid = uuid
        self.journals = journals
    }
}
