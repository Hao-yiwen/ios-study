//
//  IOSViewController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/11.
//

import UIKit

class IOSViewController: UIViewController {
    
    @IBOutlet weak var xibSubContainer: UIButton!
    
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
    }

}


