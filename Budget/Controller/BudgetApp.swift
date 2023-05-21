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
        //Display Realm location for development/debugging purposes.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        
        //MARK: REALM CONFIGURATION
        let config = Realm.Configuration(
          // Set the new schema version. This must be greater than the previously used
          // version (if you've never set a schema version before, the version is 0).
          schemaVersion: 0,
          
          // Set the block which will be called automatically when opening a Realm with
          // a schema version lower than the one set above
          migrationBlock: { migration, oldSchemaVersion in
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if (oldSchemaVersion < 0)
            {
              // Nothing to do!
              // Realm will automatically detect new properties and removed properties
              // And will update the schema on disk automatically
            }
        })
      
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        
        // Now that we've told Realm how to handle the schema change, opening the file
        // will automatically perform the migration
        
        do {
          let _ = try Realm()
        } catch {
          print("Error initializing Realm: \(error)")
        }
        
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
