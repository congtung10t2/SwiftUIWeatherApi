//
//  NabTestApp.swift
//  NabTest
//
//  Created by tungdev on 27/02/2022.
//

import SwiftUI

@main
struct NabTestApp: App {
    let cache = CacheLRU<String, WeatherData>(capacity: 10)
    var body: some Scene {
        WindowGroup {
            WeatherView()
        }
    }
}
