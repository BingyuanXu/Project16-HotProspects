//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var backgroundColor = Color.black
  var body: some View {
    VStack {
      Text("Hello World")
        .padding()
        .background(backgroundColor)
      
      Text("Change background color")
        .padding()
        .contextMenu {
          Button(action: {
            self.backgroundColor = .red
          }) {
            Text("Red")
          }
          
          Button(action: {
            self.backgroundColor = .green
          }) {
            Text("Green")
          }
          
          Button(action: {
            self.backgroundColor = Color.blue
          }) {
            Text("Blue")
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
