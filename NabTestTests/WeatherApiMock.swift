//
//  WeatherApiMock.swift
//  NabTestTests
//
//  Created by tungdev on 01/03/2022.
//

import Foundation
@testable import NabTest
class WeatherApiMock: WeatherApi {
    var url: String = ""
    
    func fetchWeather(city: String, completion: @escaping (WeatherData?) -> Void) {
        if let path = Bundle.main.path(forResource: "WeatherData", ofType: "json") {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let result = try decoder.decode(WeatherData.self, from: data)
                completion(result)
            } catch {
                completion(nil)
            }
            
        }
    }
    
}
