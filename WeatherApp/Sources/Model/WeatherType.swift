//
//  WeatherType.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/10.
//

import Foundation

struct Weather: Codable {
  var consolidatedWeather: [WeatherType]
  
  enum CodingKeys: String, CodingKey {
    case consolidatedWeather = "consolidated_weather"
  }
}

struct WeatherType: Codable {
  var name: String
  var abbreviation: String
  var temperature: Float
  var humidity: Float
  
  enum CodingKeys: String, CodingKey {
    case name = "weather_state_name"
    case abbreviation = "weather_state_abbr"
    case temperature = "the_temp"
    case humidity
  }
}
