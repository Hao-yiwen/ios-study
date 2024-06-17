//
//  FlutterScreenController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/14.
//

import UIKit
import Flutter
import Toast_Swift

class FlutterScreenController: UIViewController, UIGestureRecognizerDelegate{
    var popRecognizer: InteractivePopRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // flutter引擎无预热情况
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        
        addChild(flutterViewController)
        flutterViewController.view.frame = view.bounds
        view.addSubview(flutterViewController.view)
        flutterViewController.didMove(toParent: self)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setInteractiveRecognizer()
    }
    
    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.setNavigationBarHidden(false, animated: false)   
    }
}
