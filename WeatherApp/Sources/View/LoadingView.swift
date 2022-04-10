//
//  LoadingView.swift
//  WeatherApp
//
//  Created by KEEN on 2022/04/11.
//

import UIKit
import SnapKit

class LoadingView: UIView, ViewRepresentable {
  
  private let viewSize: CGFloat = 17
  
  private let view0 = UIView()
  private let view1 = UIView()
  private let view2 = UIView()
  
  // MARK: Init
  init() {
    super.init(frame: CGRect.zero)
    createViews()
    setConstraints()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Configure
  func createViews() {
    [view0, view1, view2].forEach {
      $0.backgroundColor = .mainRedColor
      $0.layer.cornerRadius = viewSize / 2
      addSubview($0)
    }
  }
  
  func setConstraints() {
    view0.snp.makeConstraints {
      $0.centerY.equalTo(self.snp.centerY)
      $0.left.equalTo(self.snp.left)
      $0.width.equalTo(viewSize)
      $0.height.equalTo(viewSize)
    }
    
    view1.snp.makeConstraints {
      $0.centerX.equalTo(self.snp.centerX)
      $0.centerY.equalTo(self.snp.centerY)
      $0.width.equalTo(viewSize)
      $0.height.equalTo(viewSize)
    }
    
    view2.snp.makeConstraints {
      $0.centerY.equalTo(self.snp.centerY)
      $0.right.equalTo(self.snp.right)
      $0.width.equalTo(viewSize)
      $0.height.equalTo(viewSize)
    }
  }
  
  public func startAnimation() {
    self.isHidden = false
    
    let duration: CFTimeInterval = 0.5
    let animation_delay: CFTimeInterval = 0.1
    
    assert(duration >= animation_delay * 5, "animation_delay should be way smaller than duration in order to make animation natural")
    
    let translateAnimation = CABasicAnimation(keyPath: "position.y")
    translateAnimation.duration = duration
    translateAnimation.repeatCount = Float.infinity
    translateAnimation.toValue = 0
    translateAnimation.fillMode = CAMediaTimingFillMode.both
    translateAnimation.isRemovedOnCompletion = false
    translateAnimation.autoreverses = true
    
    view0.layer.add(translateAnimation, forKey: "translation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + animation_delay) { [unowned self] in
      self.view1.layer.add(translateAnimation, forKey: "translation")
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + animation_delay * 2) { [unowned self] in
      self.view2.layer.add(translateAnimation, forKey: "translation")
    }
  }
  
  public func stopAnimation() {
    self.isHidden = true
    self.view0.layer.removeAllAnimations()
    self.view1.layer.removeAllAnimations()
    self.view2.layer.removeAllAnimations()
  }
  
}
