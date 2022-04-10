//
//  ViewController.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/09.
//

import UIKit

class HomeViewController: UIViewController {

  // MARK: Properties
  let homeView = HomeView()
  let apiService = APIService()
  var locations: [Location] = []
  
  // MARK: View Life-Cycle
  override func loadView() {
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    fetchLocation(query: "se")
    fetchWeather(woeid: 628886) // test
  }
  
  // MARK: Data
  func fetchLocation(query: String) {
    apiService.fetchLocationInfo(query: query) { code, data in
      // print(data)
    }
  }
  
  func fetchWeather(woeid: Int) {
    apiService.fetchWeatherInfo(woeid: woeid) { code, data in
      // print(data)
    }
  }

}

