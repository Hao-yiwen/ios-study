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
        
        var label1 = UILabel()
        label1.text = "通过代码方式添加"
        label1.textColor = .black
        label1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label1);
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: xibSubContainer.bottomAnchor, constant: 20)
        ])
        
        var keyboardDissmissButton = UIButton(type: .system)
        keyboardDissmissButton.setTitle("键盘隐藏设置", for: .normal)
        keyboardDissmissButton.translatesAutoresizingMaskIntoConstraints = false
        keyboardDissmissButton.addTarget(self, action: #selector(keyboardDissmissButtonTapped), for: .touchUpInside)
        scrollInlineView.addSubview(keyboardDissmissButton)
        NSLayoutConstraint.activate([
            keyboardDissmissButton.topAnchor.constraint(equalTo: centerButton.bottomAnchor, constant: 20),
            keyboardDissmissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardDissmissButton.bottomAnchor.constraint(equalTo: scrollInlineView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func keyboardDissmissButtonTapped(){
        let keyboardDissmissController = KeyboardDissmissController()
        self.navigationController?.pushViewController(keyboardDissmissController, animated: true)
    }

}


