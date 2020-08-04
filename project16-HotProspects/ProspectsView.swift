//
//  ProspectsView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-04.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
  @EnvironmentObject var prospects: Prospects
  
  enum FilterType {
    case none, contacted, uncontacted
  }
  
  let filter: FilterType
  
  var title: String {
    switch filter {
    case .none:
      return "Everyone"
    case .contacted:
      return "Contacted people"
    case .uncontacted:
      return "Uncontacted people"
    }
  }
  
  var body: some View {
    NavigationView {
      Text("People: \(prospects.people.count)")
        .navigationBarTitle(title)
        .navigationBarItems(leading: Button(action: {
          let prospect = Prospect()
          prospect.name = "Paul Hudson"
          prospect.emailAddress = "paul@hackingwithswift.com"
          self.prospects.people.append(prospect)
        }){
          Image(systemName: "qrcode.viewfinder")
          Text("Scan")
        })
    }
  }
}

struct ProspectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProspectsView(filter: .none)
  }
}