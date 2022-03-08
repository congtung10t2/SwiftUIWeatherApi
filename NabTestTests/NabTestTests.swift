//
//  NabTestTests.swift
//  NabTestTests
//
//  Created by tungdev on 27/02/2022.
//

import XCTest
@testable import NabTest

class NabTestTests: XCTestCase {
    func testResponseRightData() {
        let api = WeatherApiMock()
        api.fetchWeather(city: "") { data in
            XCTAssertTrue(data!.city.name == "Ho Chi Minh City")
            XCTAssertTrue(data!.city.country == "VN")
        }
    }
}
