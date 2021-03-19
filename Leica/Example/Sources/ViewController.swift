//
//  ViewController.swift
//  Example
//
//  Created by KIHYUN SO on 2021/03/18.
//

import UIKit
import Leica

class ViewController: UIViewController {
  
  let typingLabel = LeicaLabel()
  let text = "동해물과 백두산이 마르고 닳도록\n"
    + "하느님이 보우하사 우리 나라만세\n"
    + "무궁화 삼천리 화려강산\n"
    + "대한사람 대한으로 길이 보전하세"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGreen
    view.addSubview(typingLabel)
    
    typingLabel.translatesAutoresizingMaskIntoConstraints = false
    typingLabel.leadingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.leadingAnchor,
      constant: 32
    ).isActive = true
    typingLabel.trailingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32
    ).isActive = true
    typingLabel.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32
    ).isActive = true
    typingLabel.bottomAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32
    ).isActive = true
    typingLabel.textColor = .white
    typingLabel.font = UIFont.boldSystemFont(ofSize: 32)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    typingLabel.animate(text: text, style: .typing, loop: true)
  }

}

