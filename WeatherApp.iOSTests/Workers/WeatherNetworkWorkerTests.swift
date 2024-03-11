//
//  WeatherNetworkWorkerTests.swift
//  WeatherApp.iOSTests
//
//  Created by Dipankar Biswas on 3/11/24.
//

import XCTest
@testable import WeatherApp_iOS


final class WeatherNetworkWorkerTests: XCTestCase {
    func test_whenFetchCurrentWeatherIscalled_andServerReturnsValidData_shouldReturnTodaysWeather() async throws {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: currentWeatherResponseJson))
        let weather = try await sut.fetchCurrent(city: "Dhaka")
        
        XCTAssertEqual(weather.currentTemp, 40)
        XCTAssertEqual(weather.threeDayForecast.count, 3)
    }
    
    func test_whenFetchCurrentWeatherIsCalled_andServerReturnInvalidData_shouldThrowError() async {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: "this is a invalid reponse"))
        
        var weather: TodaysWeather?
        var err: ApiServiceError?
        
        do {
            weather = try await sut.fetchCurrent(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(weather)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.invalidResponse)
    }
    
    func test_whenFetchCurrentWeatherIsCalled_andServerReturnsError_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: ErrorHTTPClientStub())
        
        var weather: TodaysWeather?
        var err: ApiServiceError?
        
        do {
            weather = try await sut.fetchCurrent(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(weather)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
    
    func test_whenFetchCurrentWeatherIsCalled_andServerReturnsInvalidStatusCode_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: InvalidCodeHTTPClientStub())
        
        var weather: TodaysWeather?
        var err: ApiServiceError?
        
        do {
            weather = try await sut.fetchCurrent(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(weather)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
    
    
    
    func test_whenFetchFiveDayForecastsIscalled_andServerReturnsValidData_shouldReturnTodaysWeather() async throws {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: fiveDayForecastResponseJson))
        let forecasts = try await sut.fetchFiveDayForecasts(city: "Dhaka")
        
        XCTAssertEqual(forecasts.count, 5)
    }
    
    func test_whenFetchFiveDayForecastsIscalled_andServerReturnInvalidData_shouldThrowError() async {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: "this is a invalid reponse"))
        
        var forecasts: [DailyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchFiveDayForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.invalidResponse)
    }
    
    func test_whenFetchFiveDayForecastsIscalled_andServerReturnsError_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: ErrorHTTPClientStub())
        
        var forecasts: [DailyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchFiveDayForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
    
    func test_whenFetchFiveDayForecastsIscalled_andServerReturnsInvalidStatusCode_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: InvalidCodeHTTPClientStub())
        
        var forecasts: [DailyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchFiveDayForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
    
    
    func test_whenFetchHourlyForecastsIscalled_andServerReturnsValidData_shouldReturnTodaysWeather() async throws {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: twentyFourHoursForecastResponseJson))
        let forecasts = try await sut.fetchHourlyForecasts(city: "Dhaka")
        
        XCTAssertEqual(forecasts.count, 24)
    }
    
    func test_whenFetchHourlyForecastsIscalled_andServerReturnInvalidData_shouldThrowError() async {
        let sut = WeatherNetworkWorker(httpClient: DataHTTPClientStub(jsonStr: "this is a invalid reponse"))
        
        var forecasts: [HourlyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchHourlyForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.invalidResponse)
    }
    
    func test_whenFetchHourlyForecastsIscalled_andServerReturnsError_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: ErrorHTTPClientStub())
        
        var forecasts: [HourlyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchHourlyForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
    
    func test_whenFetchHourlyForecastsIscalled_andServerReturnsInvalidStatusCode_shouldThrowNetworkError() async {
        let sut = WeatherNetworkWorker(httpClient: InvalidCodeHTTPClientStub())
        
        var forecasts: [HourlyForecast]?
        var err: ApiServiceError?
        
        do {
            forecasts = try await sut.fetchHourlyForecasts(city: "Dhaka")
        } catch {
            err = error as? ApiServiceError
        }
        
        XCTAssertNil(forecasts)
        XCTAssertNotNil(err)
        XCTAssertEqual(err, ApiServiceError.networkError)
    }
}



// MARK: - mocks and stubs

class DataHTTPClientStub: HTTPClientProtocol {
    let jsonStr: String
    
    init(jsonStr: String) {
        self.jsonStr = jsonStr
    }
    
    func sendGetHTTPRequest(url: URL, headers: [String : String]?, data: Data?) async throws -> (Int, Data) {
        return (200, jsonStr.data(using: .utf8)!)
    }
}



class ErrorHTTPClientStub: HTTPClientProtocol {
    struct FakeError: Error {}
    
    func sendGetHTTPRequest(url: URL, headers: [String : String]?, data: Data?) async throws -> (Int, Data) {
        throw FakeError()
    }
}


class InvalidCodeHTTPClientStub: HTTPClientProtocol {
    func sendGetHTTPRequest(url: URL, headers: [String : String]?, data: Data?) async throws -> (Int, Data) {
        return (500, Data())
    }
}


let currentWeatherResponseJson = """
{"city":"dhaka","currentTemp":40,"maxTemp":45,"minTemp":33,"condition":"Haze","airQuality":55,"threeDayForecast":[{"day":"Tue","date":"3/19","condition":"Snow","maxTemp":34,"minTemp":33,"wind":14.127278,"icon":"sun.haze"},{"day":"Wed","date":"3/20","condition":"Snow","maxTemp":35,"minTemp":33,"wind":97.18863,"icon":"snowflake"},{"day":"Thu","date":"3/21","condition":"Snow","maxTemp":47,"minTemp":38,"wind":18.476736,"icon":"snowflake"}]}
"""

let fiveDayForecastResponseJson = """
{"city":"dhaka","forecasts":[{"day":"Mon","date":"3/18","condition":"Clody","maxTemp":42,"minTemp":41,"wind":70.75197,"icon":"sun.max"},{"day":"Tue","date":"3/19","condition":"Haze","maxTemp":17,"minTemp":10,"wind":94.03328,"icon":"cloud.sun"},{"day":"Wed","date":"3/20","condition":"Clody","maxTemp":33,"minTemp":29,"wind":5.4727435,"icon":"cloud"},{"day":"Thu","date":"3/21","condition":"Clody","maxTemp":29,"minTemp":20,"wind":85.40245,"icon":"sun.haze"},{"day":"Fri","date":"3/22","condition":"Clody","maxTemp":45,"minTemp":42,"wind":75.17533,"icon":"wind.snow"}]}
"""

let twentyFourHoursForecastResponseJson = """
{"city":"dhaka","forecasts":[{"temp":36,"hour":"11:00","wind":28.73088,"icon":"cloud.rain"},{"temp":13,"hour":"12:00","wind":65.64755,"icon":"cloud.rain"},{"temp":40,"hour":"13:00","wind":49.885666,"icon":"cloud.sun"},{"temp":6,"hour":"14:00","wind":2.6629329,"icon":"wind.snow"},{"temp":11,"hour":"15:00","wind":89.678505,"icon":"sun.rain"},{"temp":2,"hour":"16:00","wind":99.27194,"icon":"sun.max"},{"temp":13,"hour":"17:00","wind":83.17214,"icon":"sun.rain"},{"temp":42,"hour":"18:00","wind":78.82394,"icon":"sun.haze"},{"temp":30,"hour":"19:00","wind":56.945385,"icon":"sun.max"},{"temp":31,"hour":"20:00","wind":5.7004213,"icon":"cloud.drizzle"},{"temp":9,"hour":"21:00","wind":1.6326666,"icon":"cloud"},{"temp":28,"hour":"22:00","wind":50.14212,"icon":"cloud.drizzle"},{"temp":36,"hour":"23:00","wind":2.0281553,"icon":"snowflake"},{"temp":41,"hour":"00:00","wind":1.2536526,"icon":"snowflake"},{"temp":15,"hour":"01:00","wind":92.755844,"icon":"snowflake"},{"temp":10,"hour":"02:00","wind":51.82824,"icon":"sun.rain"},{"temp":42,"hour":"03:00","wind":12.409759,"icon":"cloud.rain"},{"temp":10,"hour":"04:00","wind":33.00853,"icon":"sun.dust"},{"temp":27,"hour":"05:00","wind":45.29635,"icon":"sun.max"},{"temp":15,"hour":"06:00","wind":41.132988,"icon":"sun.haze"},{"temp":17,"hour":"07:00","wind":25.563633,"icon":"cloud.sun"},{"temp":35,"hour":"08:00","wind":2.4762273,"icon":"cloud.sun"},{"temp":15,"hour":"09:00","wind":93.43685,"icon":"sun.haze"},{"temp":7,"hour":"10:00","wind":30.436647,"icon":"cloud.sun"}]}
"""
