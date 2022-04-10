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
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    return tableView
  }()
  
  let loadingView = LoadingView()
  
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
    addSubview(loadingView)
  }
  
  func setConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    loadingView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    loadingView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(160)
      $0.trailing.equalToSuperview().offset(-160)
      $0.width.equalTo(loadingView.snp.height)
    }
  }
}
