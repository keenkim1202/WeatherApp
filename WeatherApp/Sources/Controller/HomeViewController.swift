//
//  ViewController.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/09.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

  // MARK: Properties
  let homeView = HomeView()
  let apiService = APIService()
  var locations: [Location] = [] {
    didSet {
      self.fetch(locations: locations) { weatherList in
        self.weatherList = weatherList
      }
    }
  }
  var weatherList: [[WeatherType]] = [] {
    didSet {
      self.homeView.tableView.reloadData()
    }
  }
  
  // MARK: View Life-Cycle
  override func loadView() {
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    configure()
    fetchLocation(query: "se")
    // fetchData(locations: locations)
  }
  
  private func configure() {
    title = "Local Weather"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    homeView.tableView.delegate = self
    homeView.tableView.dataSource = self
  }
  
  // MARK: Data
  func fetchLocation(query: String) {
    DispatchQueue.global().async {
      self.apiService.fetchLocationInfo(query: query) { code, data in
        
        DispatchQueue.main.async {
          self.locations = data
        }
      }
    }
  }
  
  // func fetchData(locations: [Location]) {
  //   locations.forEach {
  //     print("1", self.locations.count, self.weatherList)
  //       self.apiService.fetchWeatherInfo(woeid: $0.woeid) { code, data in
  //         print("appended")
  //         DispatchQueue.main.async {
  //           self.weatherList.append([data[0], data[1]])
  //         }
  //       }
  //   }
  //
  //   self.homeView.tableView.reloadData()
  //   print("4", self.locations.count, self.weatherList)
  // }
  
  func fetch(locations: [Location], completion: @escaping ([[WeatherType]]) -> Void) {
    var weatherList: [[WeatherType]] = []
    
    locations.forEach {
      print("1", self.locations.count, self.weatherList)
      self.apiService.fetchWeatherInfo(woeid: $0.woeid) { code, data in
        print("appended")
        DispatchQueue.main.async {
          weatherList.append([data[0], data[1]])
        }
      }
    }
    
    completion(weatherList)
  }
  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    let location = locations[indexPath.row]
    cell.cityLabel.text = location.title
    
    
    if !weatherList.isEmpty {
      let weather = weatherList[indexPath.row]
      let today = weather[0]
      let tommorrow = weather[1]
      
      [today, tommorrow].forEach {
        cell.todayView.stateNameLabel.text = $0.name
        cell.todayView.imageView.kf.setImage(with: Endpoint.icon(abbr: $0.abbreviation).url)
        cell.todayView.tempLabel.text = "\(round($0.temperature * 10) / 10)℃"
        cell.todayView.humidityLabel.text = "\(Int($0.humidity))%"
      }
    }
    
    return cell
  }

}

