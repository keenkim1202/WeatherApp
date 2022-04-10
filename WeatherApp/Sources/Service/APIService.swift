//
//  APIService.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/10.
//

import Foundation
import Alamofire

class APIService {
  func fetchLocationInfo(query: String, result: @escaping (Int, [Location]) -> Void) {
    let url = Endpoint.locationSearch.url
    
    let params: Parameters = [
      "query": query
    ]
    
    AF.request(url, method: .get, parameters: params)
      .validate(statusCode: 200..<500)
      .responseDecodable(of: [Location].self) { response in
        
        switch response.result {
        case .success(let value):
          let code = response.response?.statusCode ?? 500
          result(code, value)
          
        case .failure(let error):
          print("ERROR: \(error.localizedDescription)")
        }
      }
  }
  
  func fetchWeatherInfo(woeid: Int, result: @escaping (Int, [WeatherType]) -> Void) {
    let url = Endpoint.location(id: woeid).url
    
    AF.request(url, method: .get)
      .validate(statusCode: 200..<500)
      .responseDecodable(of: Weather.self) { response in
        
        switch response.result {
        case .success(let value):
          let code = response.response?.statusCode ?? 500
          result(code, value.consolidatedWeather)
          
        case .failure(let error):
          print("ERROR: \(error.localizedDescription)")
        }
      }
  }
  
}
