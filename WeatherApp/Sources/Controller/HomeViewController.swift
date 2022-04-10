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
  
    configure()
    fetchLocation(query: "se")
    fetchWeather(woeid: 628886) // test
  }
  
  private func configure() {
    title = "Local Weather"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    homeView.tableView.delegate = self
    homeView.tableView.dataSource = self
  }
  
  // MARK: Data
  func fetchLocation(query: String) {
    apiService.fetchLocationInfo(query: query) { code, data in

    }
  }
  
  func fetchWeather(woeid: Int) {
    apiService.fetchWeatherInfo(woeid: woeid) { code, data in
      
    }
  }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5 
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
    return cell
  }

}

