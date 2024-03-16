//
//  FiveDayForecastInteractorTests.swift
//  WeatherApp.iOSTests
//
//  Created by Dipankar Biswas on 3/16/24.
//


import XCTest
@testable import WeatherApp_iOS

class FiveDayForecastInteractorTests: XCTestCase {
    
    func test_loadCurrentWeather_calls_presenter_to_present_currentWeather() async throws {
        let presenterSpy = FiveDayForecastPresenterSpy()
        let sut = FiveDayForecastInteractor(worker: WeatherNetworkWorkerStub())
        sut.presenter = presenterSpy
        
        let request = FiveDayForecast.LoadForecast.Request(city: "Dhaka")
        await sut.loadForecast(request: request)
        
        
        XCTAssertEqual(presenterSpy.presentFiveDayForecastCalled, true)
        XCTAssertEqual(presenterSpy.forecasts, FiveDayForecastDataStore.sample.forecasts)
    }
    
    
    
    // MARK: - Test doubles
    
    class FiveDayForecastPresenterSpy: FiveDayForecastPresenterProtocol {
        var presentFiveDayForecastCalled = false
        var forecasts: [DailyForecast]?
        
        func presentForecast(response: WeatherApp_iOS.FiveDayForecast.LoadForecast.Response) async {
            presentFiveDayForecastCalled = true
            forecasts = response.forecast
        }
    }
}
