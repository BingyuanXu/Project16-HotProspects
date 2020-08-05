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
  static let saveKey = "SavedData"
  @Published private(set) var people: [Prospect]
  
  func toggle(_ prospect: Prospect) {
    objectWillChange.send()
    prospect.isContacted.toggle()
    save()
  }
  
  private func save() {
    if let data = try? JSONEncoder().encode(people) {
      UserDefaults.standard.set(data, forKey: Self.saveKey)
    }
  }
  
  func add(_ prospect: Prospect) {
      people.append(prospect)
      save()
  }
  
  init() {
    if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([Prospect].self, from: data) {
        self.people = decoded
        return
      }
    }
    self.people = []
  }
}
