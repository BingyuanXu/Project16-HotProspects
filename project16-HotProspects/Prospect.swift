//
//  Prospect.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-04.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import Foundation

class Prospect: Identifiable, Codable {
  let id = UUID()
  var name = "Anonymous"
  var emailAddress = ""
  var isContacted = false
}

class Prospects: ObservableObject {
  @Published var people: [Prospect]  
  
  init() {
    self.people = []
  }
}
