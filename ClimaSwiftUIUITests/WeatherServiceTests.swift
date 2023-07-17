//
//  WeatherServiceTests.swift
//  ClimaSwiftUIUITests
//
//  Created by Tracy on 17/07/2023.
//

import XCTest

final class WeatherServiceTests: XCTestCase {

    private var sut: WeatherService!
    
    override func setUpWithError() throws {
        //system under testing
        sut =  WeatherService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getWeatherByCity_returnParis() async throws {
        
        //actual
        let result: Result<Weather, NetworkError> = await sut.request(city: "paris")
        
        //expected
        let exp = "Paris"
        
        switch result {
        case .success(let weather):
            XCTAssertEqual(weather.city, exp)
        case .failure(let error):
            XCTFail("failure with \(error)")
        }
    }
    
    func test_getWeatherByCity_returnRennes() async throws {
        
        //actual
        let result: Result<Weather, NetworkError> = await sut.request(city: "rennes")
        
        //expected
        let exp = "Rennes"
        
        switch result {
        case .success(let weather):
            XCTAssertEqual(weather.city, exp)
        case .failure(let error):
            XCTFail("failure with \(error)")
        }
    }
    
    func test_getWeather_withWrongCity() async throws {
        
        //actual
        let result: Result<Weather, NetworkError> = await sut.request(city: "xxx")
        
        //expected
        let exp = NetworkError.serverError
        
        switch result {
        case .success(_):
            XCTFail("Expected to fail but succeeded")
        case .failure(let error):
            XCTAssertEqual(error, exp)
        }
    }


}
