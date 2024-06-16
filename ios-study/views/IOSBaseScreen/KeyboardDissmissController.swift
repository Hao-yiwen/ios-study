//
//  KeyboardDissmissController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit

class KeyboardDissmissController:ViewBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let textField = UITextField()
        textField.placeholder = "键盘消失点击测试"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        addCompleteButton(textField: textField)
        
        textField.delegate = self
        
        self.navigationItem.title = "键盘消失测试"
    }
}
