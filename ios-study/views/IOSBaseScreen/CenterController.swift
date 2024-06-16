//
//  CenterController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit

class CenterController:UIViewController{
    @IBOutlet weak var stackview: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "name"
        view.addSubview(label)
        
        let textInput = UITextField()
        textInput.placeholder = "请输入name"
        textInput.borderStyle = .roundedRect
                
        // 创建一个新的 stack view
        let innerStackView = UIStackView(arrangedSubviews: [label, textInput])
        innerStackView.axis = .horizontal
        innerStackView.alignment = .center
        innerStackView.spacing = 20
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(innerStackView)
        
        // 设置约束
        NSLayoutConstraint.activate([
            // 将新的 stack view 水平居中
            innerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 将新的 stack view 的顶部距离原来的 stack view 20 点
            innerStackView.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 20)
        ])
    }
}
