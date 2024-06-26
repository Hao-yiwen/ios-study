//
//  ThirdSDKHomeController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/14.
//

import UIKit

class ThirdSDKHomeController: ViewBaseController{
    @IBOutlet weak var lottieBtn: UIButton!
    
    @IBOutlet weak var scrollviewContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapBtn = UIButton(type: .system)
        mapBtn.setTitle("MapView", for: .normal)
        mapBtn.translatesAutoresizingMaskIntoConstraints = false
        mapBtn.addTarget(self, action: #selector(mapBtnTapped), for: .touchUpInside)
        
        view.addSubview(mapBtn)
        NSLayoutConstraint.activate([
            mapBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapBtn.topAnchor.constraint(equalTo: lottieBtn.bottomAnchor, constant: 20),
            mapBtn.bottomAnchor.constraint(equalTo: scrollviewContentView.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func mapBtnTapped(){
        let mapVC = MapViewController()
        navigationController?.pushViewController(mapVC, animated: true)
    }
}
