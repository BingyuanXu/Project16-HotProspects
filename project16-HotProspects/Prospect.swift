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
  fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
  @Published var people: [Prospect]
  
  func toggle(_ prospect: Prospect) {
    objectWillChange.send()
    prospect.isContacted.toggle()
    save()
  }
  
  func save() {
    if let data = try? JSONEncoder().encode(people) {
      UserDefaults.standard.set(data, forKey: "SavedData")
    }
  }
  
  init() {
    if let items = UserDefaults.standard.data(forKey: "SavedData") {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([Prospect].self, from: items) {
        self.people = decoded
        return
      }
    }
    self.people = []
  }
}
