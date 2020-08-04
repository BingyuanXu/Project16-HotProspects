//
//  ContentView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  enum NetworkError: Error {
    case badURL, requestFailed, unknown
  }
  
  func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
    // check the URL is OK, otherwise return with a failure
    guard let url = URL(string: urlString) else {
      completion(.failure(.badURL))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      // the task has completed – push our work back to the main thread
      DispatchQueue.main.async {
        if let data = data {
          // success: convert the data to a string and send it back
          let stringData = String(decoding: data, as: UTF8.self)
          completion(.success(stringData))
        } else if error != nil {
          // any sort of network failure
          completion(.failure(.requestFailed))
        } else {
          // this ought not to be possible, yet here we are
          completion(.failure(.unknown))
        }
      }
    }.resume()
  }
  
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        self.fetchData(from: "https://www.apple.com") { result in
          switch result {
          case .failure(let error) :
            switch error {
            case .badURL:
              print("bad URL")
            case .requestFailed:
              print("request Failed")
            case .unknown:
              print("unknown")
            }
            
          case .success(let str):
            print(str)
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
