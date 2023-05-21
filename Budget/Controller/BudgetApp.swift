//
//  BudgetApp.swift
//  Budget
//
//  Created by Luciano Patino on 5/7/23.
//

import SwiftUI
import RealmSwift


@main
struct BudgetApp: SwiftUI.App {
    init() {
        print("Colors application is starting up. App initialiser.")
        let dog = Dog()
        dog.name = "Rex"
        print("name of dog: \(dog.name)")
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(dog)
            print(dog.name)
        }

        // Update the dog's name to see the effect.
        try! realm.write {
            dog.name = "Wolfie"
            print("name of dog: \(dog.name)")
        }
        
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
