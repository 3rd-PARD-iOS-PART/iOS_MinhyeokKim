//
//  TextFieldView.swift
//  6th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/07.
//

import UIKit

class TextFieldView: UITextField {
    override  init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.borderStyle = .roundedRect
    }
    
    func setPlaceHolder(_ hint: String) {
        self.placeholder = hint
    }
}
