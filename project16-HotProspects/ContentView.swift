//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0
  var body: some View {
    TabView(selection: $selectedTab) {
      Text("View 1")
        .onTapGesture {
          self.selectedTab = 1
      }
      .tabItem {
        Image(systemName: "star")
        Text("tab 1")
      }
      .tag(0)
      
      Text("View 2")
        .onTapGesture {
          self.selectedTab = 0
      }
        .tabItem {
          Image(systemName: "star.fill")
          Text("tab 2")
      }
      .tag(1)
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
