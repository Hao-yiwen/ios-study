//
//  SubviewOverView2Controller.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit

class SubviewOverView2Controller:ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        view1.backgroundColor = .yellow
        view1.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        
        let childView = UIView()
        childView.backgroundColor = .red
        childView.translatesAutoresizingMaskIntoConstraints = false
        view2.addSubview(childView)
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            view1.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor,constant: 20),
            view2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            view2.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            childView.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            childView.topAnchor.constraint(equalTo: view1.topAnchor, constant: 100),
            childView.widthAnchor.constraint(equalToConstant: 200),
            childView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
