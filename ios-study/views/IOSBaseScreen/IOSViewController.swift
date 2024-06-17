//
//  IOSViewController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/11.
//

import UIKit

class IOSViewController: UIViewController {
    
    @IBOutlet weak var xibSubContainer: UIButton!
    
    @IBOutlet weak var centerButton: UIButton!
    
    @IBOutlet weak var scrollInlineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        label1.text = "通过代码方式添加"
        label1.textColor = .black
        label1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label1);
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: xibSubContainer.bottomAnchor, constant: 20)
        ])
        
        // 添加键盘隐藏按钮 -> 键盘隐藏示例页面
        let keyboardDissmissButton = UIButton(type: .system)
        keyboardDissmissButton.setTitle("键盘隐藏设置", for: .normal)
        keyboardDissmissButton.translatesAutoresizingMaskIntoConstraints = false
        keyboardDissmissButton.addTarget(self, action: #selector(keyboardDissmissButtonTapped), for: .touchUpInside)
        scrollInlineView.addSubview(keyboardDissmissButton)
        NSLayoutConstraint.activate([
            keyboardDissmissButton.topAnchor.constraint(equalTo: centerButton.bottomAnchor, constant: 20),
            keyboardDissmissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // 添加notification按钮 -> 通知示例页面
        let notificationButton = UIButton(type: .system)
        notificationButton.setTitle("通知示例页面", for: .normal)
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        scrollInlineView.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: keyboardDissmissButton.bottomAnchor, constant: 20),
            notificationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationButton.bottomAnchor.constraint(equalTo: scrollInlineView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func keyboardDissmissButtonTapped(){
        let keyboardDissmissController = KeyboardDissmissController()
        self.navigationController?.pushViewController(keyboardDissmissController, animated: true)
    }
    
    @objc func notificationButtonTapped(){
        let notificationController = NotificationViewController()
        self.navigationController?.pushViewController(notificationController, animated: true)
    }

}


