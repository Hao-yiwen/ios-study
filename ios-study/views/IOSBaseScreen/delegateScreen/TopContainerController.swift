//
//  TopContainerController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit

class TopContainerController: UIViewController {
    
    weak var delegate:(ButtonclickDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton()
        button.setTitle("点击", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func handleClick(){
        print("Button was tapped!")
        delegate?.buttonClicked()
    }
}
