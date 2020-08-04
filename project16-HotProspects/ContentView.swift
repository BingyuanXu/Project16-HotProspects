//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
  let possibleNumber = Array(1...60)
  var results: String {
    let numbers = possibleNumber.random(7).sorted()
    let strings = numbers.map(String.init)
    return strings.joined(separator: ",")
  }
  var body: some View {
    Text(results)
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
