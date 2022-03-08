//
//  WeatherView.swift
//  NabTest
//
//  Created by tungdev on 27/02/2022.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI
struct WeatherItemView: View {
    private let model: WeatherDetails
    let url = "https://openweathermap.org/img/wn/%@@2x.png"
    init(model: WeatherDetails) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Cloud: \(model.clouds)")
                Text("Degree: \(model.deg)")
                Text("Wind Speed: \(model.speed)")
                Text("Pressure: \(model.pressure)")
                Text("Humidity: \(model.humidity)")
                Text("Min tempurature: \(model.temp.min)")
                Text("Max tempurature: \(model.temp.min)")
                //            model.weather.first?.icon
            }
            .font(.footnote)
            if let icon = model.weather.first?.icon, let iconUrl = String(format: url, icon) {
                CacheAsyncImage(url: URL(string: iconUrl)!) { phase in
                    
                    switch phase {
                    case .success(let image):
                        image
                            .imageModifier()
                            .transition(.scale)
                    case .failure(_):
                        Image(systemName: "ant.circle.fill").iconModifier()
                    case .empty:
                        Image(systemName: "photo.circle.fill").iconModifier()
                    @unknown default:
                        ProgressView()
                    }
                    
                }
            }
            
        }
        
    }
}
