//
//  Image+Extensions.swift
//  NabTest
//
//  Created by tungdev on 06/03/2022.
//

import Foundation
import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 64)
      .foregroundColor(.purple)
      .opacity(0.5)
  }
}

