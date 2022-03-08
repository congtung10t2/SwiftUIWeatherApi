//
//  WeatherViewModel.swift
//  NabTest
//
//  Created by tungdev on 27/02/2022.
//  Copyright (c) 2022. All rights reserved.
//

import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {
    var weatherApi: WeatherApi
    init(weatherApi: WeatherApi) {
        self.weatherApi = weatherApi
    }
    @Published var model: WeatherData? = nil
    func fetchWeather(city: String) {
        weatherApi.fetchWeather(city: city) { data in
            self.model = data
        }
    }
}
