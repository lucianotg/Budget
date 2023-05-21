//
//  PlaidItem.swift
//  Week
//
//  Created by Luciano Patino on 11/27/19.
//  Copyright © 2019 net.takegive. All rights reserved.
//
//From Plaid Documentation: an Item set of credentials at a financial institution; each Item can have many Accounts, and some Accounts have Transactions associated with them

import Foundation
import RealmSwift

class PlaidItem: Object {
  @objc dynamic var publicToken = String()
  @objc dynamic var link_session_id = String()
  @objc dynamic var name = String()
  @objc dynamic var institution_id = String()

  let accounts = List<PlaidAccount>()

  @objc dynamic var plaidItemID = UUID().uuidString
  override static func primaryKey() -> String? {
    return "plaidItemID"
  }
  
  enum SerializationError: Error {
    case missing(String)
  }
  
  convenience init(publicToken: String, metadata: [String: Any]) throws {
    self.init()
    
    guard publicToken != "" else {
      throw SerializationError.missing("Error saving Public Token.")
    }
    
    guard let linkSessionID = metadata["link_session_id"] as? String else {
      throw SerializationError.missing("Error saving Link Session ID.")
    }
    
    guard let institution = metadata["institution"] as? [String:Any] else {
      throw SerializationError.missing("Error saving Institution.")
    }
    
    guard let institutionID = institution["institution_id"] as? String else {
      throw SerializationError.missing("Error saving Institution ID.")
    }
    
    guard let name = institution["name"] as? String else {
      throw SerializationError.missing("Error saving Institution name.")
    }
    
    self.publicToken = publicToken
    self.link_session_id = linkSessionID
    self.institution_id = institutionID
    self.name = name
    
  }

}
