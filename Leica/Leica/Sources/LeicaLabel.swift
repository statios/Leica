//
//  LeicaLabel.swift
//  Leica
//
//  Created by KIHYUN SO on 2021/03/18.
//

import UIKit

open class LeicaLabel: UILabel {
  
  public enum Animation {
    case typing
  }
  
  private var cursorText = "│"
  private var cursorIsHidden = true
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  public func animate(
    text: String,
    style: Animation,
    loop: Bool = false,
    completion: (() -> Void)? = nil
  ) {
    
    switch style {
    case .typing: typing(text: text, repeats: loop, completion: completion ?? {} )
    }
  }
  
  private func typing(text: String, repeats: Bool, completion: @escaping (() -> Void)) {
    
    var typingCount = 0
    
    Timer.scheduledTimer(withTimeInterval: 0.14, repeats: true) { (t) in
      guard typingCount != text.count else {
        t.invalidate()
        return
      }
      
      let string = String(text[...typingCount] + self.cursorText)
      
      let attString = NSMutableAttributedString(
        string: string,
        attributes: [
          .font: self.font as Any,
          .foregroundColor: self.textColor as Any
        ]
      )
      
      attString.addAttribute(
        .font,
        value: UIFont.systemFont(ofSize: self.font.pointSize, weight: .thin),
        range: (string as NSString).range(of: self.cursorText)
      )
      
      self.attributedText = attString
      
      typingCount += 1
    }
    
    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
      guard let attributedText = self.attributedText else { return }
      let attString = NSMutableAttributedString(attributedString: attributedText)
      attString.setAttributes(
        [
          NSAttributedString.Key.foregroundColor: self.cursorIsHidden ? UIColor.clear : self.textColor as Any,
          NSAttributedString.Key.font: UIFont.systemFont(ofSize: self.font.pointSize, weight: .thin)
        ],
        range: (attString.string as NSString).range(of: self.cursorText)
      )
      self.attributedText = attString
      self.cursorIsHidden.toggle()
    }
    
  }
  
  private func setupUI() {
    numberOfLines = 0
  }
  
}
