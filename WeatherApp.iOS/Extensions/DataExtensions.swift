//
//  DataExtensions.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/11/24.
//

import Foundation


enum DataError: Error {
    case decodingError
}

extension Data {
    
    func decode<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws ->  T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            print(error)
            throw DataError.decodingError
        }
    }
    
}
