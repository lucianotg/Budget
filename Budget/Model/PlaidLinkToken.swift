//
//  PlaidLinkToken.swift
//  Week
//
//  Created by Luciano Patino on 8/9/20.
//  Copyright © 2020 net.takegive. All rights reserved.
//

import Foundation
import RealmSwift

class PlaidLinkToken: Object {
  @objc dynamic var expiration = String()
  @objc dynamic var link_token = String()
  @objc dynamic var request_id = String()

  let accounts = List<PlaidAccount>()

  @objc dynamic var plaidItemID = UUID().uuidString
  override static func primaryKey() -> String? {
    return "plaidItemID"
  }
  
  enum SerializationError: Error {
    case missing(String)
  }
  
  convenience init(metadata: [String: Any]) throws {
    self.init()
    
    guard let expiration = metadata["expiration"] as? String else {
      throw SerializationError.missing("Expiration is missing.")
    }
    
    guard let link_token = metadata["link_token"] as? String else {
      throw SerializationError.missing("Link Token is missing.")
    }
    
    guard let request_id = metadata["request_id"] as? String else {
      throw SerializationError.missing("Request ID is missing.")
    }
    
    self.expiration = expiration
    self.link_token = link_token
    self.request_id = request_id
    
  }
}
