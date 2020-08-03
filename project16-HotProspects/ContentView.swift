//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
  @Published var name = "Taylor Swift"
}

struct ContentView: View {
  let user = User()   //must have , if not, will crash
    var body: some View {
      VStack {
        EditView()
        DisplayView()
      }
      .environmentObject(user)
  }
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
