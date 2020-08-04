//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
  var value = 0 {
    willSet {
      objectWillChange.send()
    }
  }
  
  init() {
    for i in 1...10 {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)){
        self.value += 1
      }
    }
  }
}

struct ContentView: View {
  @ObservedObject var updater = DelayedUpdater()
  
  
  var body: some View {
    Text("value is : \(updater.value)")
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
