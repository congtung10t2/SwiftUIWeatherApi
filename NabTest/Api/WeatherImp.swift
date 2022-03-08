//
//  WeatherImp.swift
//  NabTest
//
//  Created by tungdev on 01/03/2022.
//

import Foundation
import Combine
class WeatherImp: WeatherApi {
    private var task: AnyCancellable?
    let url = "https://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=7&appid=60c6fbeb4b93ac653c492ba806fc346d&units=metric"
    func fetchWeather(city: String, completion: @escaping (WeatherData?) -> Void) {
        guard let url = URL(string: String(format: url, city)) else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        task = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherData?.self, decoder: decoder)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { data in
                completion(data)
            })
    }
}
