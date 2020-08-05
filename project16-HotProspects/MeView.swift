//
//  MeView.swift
//  project16-HotProspects
//
//  Created by bingyuan xu on 2020-08-04.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
  
  @State private var name = "Anonymous"
  @State private var emailAddress = "you@yoursite.com"
  
  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()
  
  func generateQRCode(from string: String) -> UIImage {
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")
    
    if let outputImage = filter.outputImage {
      if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        return UIImage(cgImage: cgimg)
      }
    }
    
    return UIImage(systemName: "xmark.circle") ?? UIImage()
  }
  
  var body: some View {
    NavigationView {
      VStack {
        TextField("Name", text: $name)
          .textContentType(.name)
          .font(.title)
          .padding(.horizontal)
        
        TextField("Email address", text: $emailAddress)
          .textContentType(.emailAddress)
          .font(.title)
          .padding([.horizontal, .bottom])
        
        Spacer()
        
        Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
          .interpolation(.none)
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
      }
      .navigationBarTitle("Your code")
    }
  }
}

struct MeView_Previews: PreviewProvider {
  static var previews: some View {
    MeView()
  }
}
