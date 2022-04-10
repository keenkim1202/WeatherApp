//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/10.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell, ViewRepresentable {
  
  static let identifier = String(describing: WeatherTableViewCell.self)

  // MARK: - UI
  let cityLabel: UILabel = {
    let label = UILabel()
    label.text = "city name"
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    return label
  }()
  
  let todayView = WeatherInfoView()
  let tomorrowView = WeatherInfoView()
  
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func createViews() {
    [cityLabel, todayView, tomorrowView].forEach {
      contentView.addSubview($0)
    }
  }
  
  func setConstraints() {
    cityLabel.translatesAutoresizingMaskIntoConstraints = false
    todayView.translatesAutoresizingMaskIntoConstraints = false
    tomorrowView.translatesAutoresizingMaskIntoConstraints = false
    
    let safeArea = contentView.safeAreaLayoutGuide
    
    cityLabel.snp.makeConstraints {
      $0.leading.equalTo(safeArea).offset(10)
      $0.trailing.equalTo(safeArea).offset(-10)
      $0.top.equalTo(safeArea).offset(10)
    }
    
    todayView.snp.makeConstraints {
      $0.width.equalTo(todayView.snp.height).multipliedBy(2)
      $0.leading.equalTo(safeArea).offset(10)
      $0.top.equalTo(cityLabel.snp.bottom).offset(10)
      $0.bottom.equalTo(safeArea).offset(-10)
    }

    tomorrowView.snp.makeConstraints {
      $0.width.equalTo(tomorrowView.snp.height).multipliedBy(2)
      $0.leading.equalTo(todayView.snp.trailing).offset(10)
      $0.trailing.equalTo(safeArea).offset(-10)
      $0.top.equalTo(cityLabel.snp.bottom).offset(10)
      $0.bottom.equalTo(safeArea).offset(-10)
    }
  }
  
}
