//
//  ViewController.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/09.
//

import UIKit
import Kingfisher
import MapKit

class HomeViewController: UIViewController {

  // MARK: Properties
  let homeView = HomeView()
  let apiService = APIService()
  
  var weatherList: [[WeatherType]] = []
  var locations: [Location] = [] {
    didSet {
      fetchData(locations: locations)
    }
  }
  
  // MARK: View Life-Cycle
  override func loadView() {
    view = homeView
    startLoading()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    configure()
    fetchLocation(query: "se")
  }
  
  private func configure() {
    configureNavigationBar()

    homeView.tableView.delegate = self
    homeView.tableView.dataSource = self
  }
  
  private func configureNavigationBar() {
    title = "Local Weather"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    let barbuttonImage = UIImage(systemName: "arrow.triangle.2.circlepath")
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: barbuttonImage, style: .plain, target: self, action: #selector(onRefresh))
    self.navigationItem.rightBarButtonItem?.isEnabled = false
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
  
  func fetchData(locations: [Location]) {
    let dispatchGroup = DispatchGroup()
    
    locations.forEach {
      dispatchGroup.enter()
      self.apiService.fetchWeatherInfo(woeid: $0.woeid) { code, data in
        self.weatherList.append([data[0], data[1]])
        
        DispatchQueue.main.async {
          dispatchGroup.leave()
        }
      }
    }
    
    dispatchGroup.notify(queue: .main) {
      self.stopLoading()
      self.homeView.tableView.scroll(to: .top, animated: true)
      self.homeView.tableView.reloadData()
    }
  }
  
  private func startLoading() {
    homeView.loadingView.startAnimation()
    self.navigationItem.rightBarButtonItem?.isEnabled = false
  }
  
  private func stopLoading() {
    homeView.loadingView.stopAnimation()
    self.navigationItem.rightBarButtonItem?.isEnabled = true
  }
  
  @objc func onRefresh() {
    startLoading()
    fetchLocation(query: "se")
    fetchData(locations: locations)
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
      
      cell.todayView.stateNameLabel.text = today.name
      cell.todayView.imageView.kf.setImage(with: Endpoint.icon(abbr: today.abbreviation).url)
      cell.todayView.tempLabel.text = "\(round(today.temperature * 10) / 10)???"
      cell.todayView.humidityLabel.text = "\(Int(today.humidity))%"
      
      cell.tomorrowView.stateNameLabel.text = tommorrow.name
      cell.tomorrowView.imageView.kf.setImage(with: Endpoint.icon(abbr: tommorrow.abbreviation).url)
      cell.tomorrowView.tempLabel.text = "\(round(tommorrow.temperature * 10) / 10)???"
      cell.tomorrowView.humidityLabel.text = "\(Int(tommorrow.humidity))%"
    } else {
      
    }
    
    return cell
  }

}

