//
//  CurrentWeatherInteractorTests.swift
//  WeatherApp.iOSTests
//
//  Created by Dipankar Biswas on 3/16/24.
//


import XCTest
@testable import WeatherApp_iOS

class CurrentWeatherInteractorTests: XCTestCase {
    
    func test_loadCurrentWeather_calls_presenter_to_present_currentWeather() async throws {
        let sut = CurrentWeatherInteractor(worker: WeatherNetworkWorkerStub())
        let presenterSpy = CurrentWeatherPresenterSpy()
        sut.presenter = presenterSpy
        
        let request = CurrentWeather.LoadWeather.Request(city: "Dhaka")
        await sut.loadCurrentWeather(request: request)
        
        XCTAssertNotNil(presenterSpy.todaysWeather)
        XCTAssertEqual(presenterSpy.todaysWeather, CurrentWeatherDataStore.sample.weather)
        XCTAssertEqual(presenterSpy.hourlyForecasts, CurrentWeatherDataStore.sample.hourlyForecasts)
    }
    
    
    // MARK: - Test doubles
    
    class CurrentWeatherPresenterSpy: CurrentWeatherPresenterProtocol {
        var presentCurrentWeatherCalled = false
        var todaysWeather: TodaysWeather?
        var hourlyForecasts: [HourlyForecast]?
        
        func presentCurrentWeather(response: WeatherApp_iOS.CurrentWeather.LoadWeather.Response) async {
            presentCurrentWeatherCalled = true
            todaysWeather = response.weather
            hourlyForecasts = response.hourlyForecast
        }
    }
}
