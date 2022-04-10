//
//  HomeView.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/09.
//

import UIKit

class HomeView: UIView, ViewRepresentable {
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func createViews() {
    
  }
  
  func setConstraints() {
    
  }
}
