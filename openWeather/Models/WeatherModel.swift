//
//  WeatherModel.swift
//  openWeather
//
//  Created by Jiten Patel on 12/03/22.
//

import Foundation

struct WeatherResponse: Decodable{
    let main: Weather
}

struct Weather: Decodable{
    var temp : Double?
    var humidity : Double?
    
}
