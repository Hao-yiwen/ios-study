//
//  BottomContainerController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit

class BottomContainerController: UIViewController,ButtonclickDelegate {
    func buttonClicked() {
        print("点击了按钮")
        label.text = "点击了按钮"
    }
    
    var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label = UILabel()
        label.text = "初始值"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    
}
