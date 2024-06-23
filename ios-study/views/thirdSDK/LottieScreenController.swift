//
//  LottieScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit
import Lottie

class LottieScreenController:ViewBaseController{
    var animatedView: LottieAnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LottieScreenController viewDidLoad")
        
        animatedView = .init(name: "loading")
        animatedView.frame = view.bounds
        animatedView!.contentMode = .scaleAspectFit
        animatedView!.loopMode = .loop
        animatedView!.animationSpeed = 1
        view.addSubview(animatedView!)
        animatedView!.play()
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.backgroundColor = .red
        NSLayoutConstraint.activate([
            animatedView!.widthAnchor.constraint(equalToConstant: 200),
            animatedView!.heightAnchor.constraint(equalToConstant: 200),
            animatedView!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            animatedView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
}
