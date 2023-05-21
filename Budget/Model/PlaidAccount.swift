//
//  PlaidAccount.swift
//  Week
//
//  Created by Luciano Patino on 11/27/19.
//  Copyright © 2019 net.takegive. All rights reserved.
//

import Foundation
import RealmSwift

class PlaidAccount: Object {
  @objc dynamic var id = String()
  @objc dynamic var name = String()
  @objc dynamic var mask = String()
  @objc dynamic var type = String()
  @objc dynamic var subtype = String()
  @objc dynamic var verificationStatus = String()
  
  @objc dynamic var plaidAccountID = UUID().uuidString
  override static func primaryKey() -> String? {
    return "plaidAccountID"
  }
  
  var parentInstitution = LinkingObjects(fromType: PlaidItem.self, property: "accounts")
  
  enum SerializationError: Error {
    case missing(String)
  }
  
  convenience init(array: [String:Any]) throws {
    self.init()
    
    guard let id = array["id"] as? String else {
      throw SerializationError.missing("ID is missing.")
    }
    
    //Prevent creation of Account if it already exists.
    
    guard let name = array["name"] as? String else {
      throw SerializationError.missing("ID is missing.")
    }
    
    guard let mask = array["mask"] as? String else {
      throw SerializationError.missing("ID is missing.")
    }
    
    guard let type = array["type"] as? String else {
      throw SerializationError.missing("ID is missing.")
    }
    
    guard let subtype = array["subtype"] as? String else {
      throw SerializationError.missing("ID is missing.")
    }
    
    self.id = id
    self.name = name
    self.mask = mask
    self.type = type
    self.subtype = subtype
    
  }
}
