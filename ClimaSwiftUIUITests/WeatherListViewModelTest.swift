//
//  WeatherListViewModelTest.swift
//  ClimaSwiftUIUITests
//
//  Created by Tracy on 17/07/2023.
//

import XCTest

final class WeatherListViewModelTest: XCTestCase {

    private var sut: WeatherListViewModel!
    
    override func setUpWithError() throws {
        //system under testing
        sut =  WeatherListViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetchWeather_isCompleted() {
        
        let exp = expectation(description: "Fetch is completed")
        
        sut.fetchWeatherEveryTenSecond()
        
        //expected
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            exp.fulfill()
            
        }
        waitForExpectations(timeout: 61)
        XCTAssert(sut.fetchCompleted)
    }
}
