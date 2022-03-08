//
//  WeatherApi.swift
//  NabTest
//
//  Created by tungdev on 01/03/2022.
//

import Foundation
protocol WeatherApi: AnyObject {
    var url: String { get }
    func fetchWeather(city: String, completion: @escaping (WeatherData?) -> Void)
}
