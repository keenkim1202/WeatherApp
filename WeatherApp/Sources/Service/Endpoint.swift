//
//  Endpoint.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/10.
//

import Foundation

enum Endpoint {
  case locationSearch
  case location(id: Int)
}

extension URL {
  static let baseURL = "https://www.metaweather.com/api"
  static func makeEndpoint(_ endpoint: String) -> URL {
    URL(string: baseURL + endpoint)!
  }
}

extension Endpoint {
  var url: URL {
    switch self {
    case .locationSearch:
      return .makeEndpoint("/location/search/")
    case .location(let id):
      return .makeEndpoint("/location/\(id)/")
    }
  }
}
