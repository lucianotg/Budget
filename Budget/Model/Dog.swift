//
//  RealmClass.swift
//  Budget
//
//  Created by Luciano Patino on 5/21/23.
//

import Foundation
import Realm
import RealmSwift

class Dog: Object {
    @Persisted var name: String
}
