//
//  WeatherServices.swift
//  openWeather
//
//  Created by Jiten Patel on 12/03/22.
//

import Foundation

class WeatherService{
    
    func getWeather(city: String, completion: @escaping (Weather?) -> () ){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d9169a986f8f6809e93dc4ee1fdc9cd1") else{
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse{
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
                
            }
        }.resume()
    }
    
}
