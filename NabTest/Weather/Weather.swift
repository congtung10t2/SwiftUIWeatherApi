//
//  Weather.swift
//  NabTest
//
//  Created by tungdev on 27/02/2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation
struct WeatherData: Decodable, Hashable {
    var city: City
    var list: [WeatherDetails]
    var cod: String
    var message: Float
    var cnt: Int
}
struct City: Decodable, Hashable {
    var id: Int
    var name: String
    var coord: Coordinator
    var country: String
    var population: Int
    var timezone: Int
    
}

struct Coordinator: Decodable, Hashable {
    var lon: Double
    var lat: Double
}

struct WeatherDetails: Decodable, Hashable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Tempurature
    var feelsLike: FeelsLike
    var pressure: Int
    var humidity: Int
    var weather: [Weather]
    var speed: Float
    var deg: Int
    var gust: Float
    var clouds: Int
    var pop: Float
}
struct Tempurature: Decodable, Hashable  {
    var day: Float
    var min: Float
    var max: Float
    var eve: Float
    var morn: Float
}

struct FeelsLike: Decodable, Hashable {
    var day: Float
    var night: Float
    var eve: Float
    var morn: Float
}

struct Weather: Decodable, Hashable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

//pressure : 1011
//humidity : 36
//weather
//0
//id : 801
//main : "Clouds"
//description : "few clouds"
//icon : "02d"
//speed : 4.84
//deg : 141
//gust : 8.14
//clouds : 15
//pop : 0
