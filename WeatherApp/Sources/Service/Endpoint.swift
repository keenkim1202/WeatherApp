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
  case icon(abbr: String)
}

extension URL {
  static let baseURL = "https://www.metaweather.com"
  static func makeEndpoint(_ endpoint: String) -> URL {
    URL(string: baseURL + endpoint)!
  }
}

extension Endpoint {
  var url: URL {
    switch self {
    case .locationSearch:
      return .makeEndpoint("/api/location/search/")
    case .location(let id):
      return .makeEndpoint("/api/location/\(id)/")
    case .icon(let abbr):
      return .makeEndpoint("/static/img/weather/png/\(abbr).png")
    }
  }
}
