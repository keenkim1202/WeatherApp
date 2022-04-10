//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/10.
//

import UIKit
import SnapKit

class WeatherInfoView: UIView, ViewRepresentable {
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "Date"
    label.textColor = .mainBlueColor
    label.backgroundColor = .backgroundColor
    label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    return label
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "square.slash")
    imageView.tintColor = .black
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let stateNameLabel: UILabel = {
    let label = UILabel()
    label.text = "state name"
    label.textColor = .mainBlackColor
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    return label
  }()
   
  let tempLabel: UILabel = {
    let label = UILabel()
    label.text = "00℃"
    label.textColor = .mainRedColor
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    return label
  }()
  
  let humidityLabel: UILabel = {
    let label = UILabel()
    label.text = "100%"
    label.textColor = .mainDarkGreyColor
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    return label
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func createViews() {
    [dateLabel, imageView, stateNameLabel, tempLabel, humidityLabel].forEach {
      addSubview($0)
    }
  }
  
  func setConstraints() {
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    stateNameLabel.translatesAutoresizingMaskIntoConstraints = false
    tempLabel.translatesAutoresizingMaskIntoConstraints = false
    humidityLabel.translatesAutoresizingMaskIntoConstraints = false
    
    dateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    
    dateLabel.snp.makeConstraints {
      $0.leading.equalTo(safeAreaLayoutGuide).offset(10)
      $0.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
      $0.top.equalTo(safeAreaLayoutGuide).offset(5)
    }
    
    imageView.snp.makeConstraints {
      $0.width.equalTo(imageView.snp.height).multipliedBy(1)
      $0.leading.equalTo(safeAreaLayoutGuide).offset(10)
      $0.top.equalTo(dateLabel.snp.bottom).offset(10)
      $0.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
    }
    
    stateNameLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(10)
      $0.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
      $0.top.equalTo(imageView.snp.top).offset(5)
    }
    
    tempLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(10)
      $0.bottom.equalTo(imageView.snp.bottom).offset(-5)
    }
    
    humidityLabel.snp.makeConstraints {
      $0.leading.equalTo(tempLabel.snp.trailing).offset(10)
      $0.bottom.equalTo(imageView.snp.bottom).offset(-5)
    }
  }
}
