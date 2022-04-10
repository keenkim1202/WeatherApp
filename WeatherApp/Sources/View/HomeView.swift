//
//  HomeView.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/09.
//

import UIKit
import SnapKit

class HomeView: UIView, ViewRepresentable {
  
  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    registerCell()
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func registerCell() {
    tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
  }
  
  func createViews() {
    addSubview(tableView)
  }
  
  func setConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
